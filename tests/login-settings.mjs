import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});

try {
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function request(body,user='test-admin',origin='http://test.local'){
  const headers={'Content-Type':'application/json',Origin:origin};
  if(user){headers['oai-authenticated-user-id']=user;headers['oai-authenticated-user-email']=user+'@example.test'}
  const r=await mf.dispatchFetch('http://test.local/api/login-settings',{method:body===undefined?'GET':'POST',headers,...(body===undefined?{}:{body:JSON.stringify(body)})});
  return {status:r.status,data:await r.json()};
 }
 const initial=await request();assert.equal(initial.status,200);assert.equal(initial.data.stage,'implemented');
 for(const user of ['', 'test-customer'])for(const body of [undefined,initial.data.settings])assert.equal((await request(body,user)).status,403);
 console.log('PASS anonymous and customer read/write denied');
 assert.equal((await request(initial.data.settings,'test-admin','https://other.example')).status,403);
 const draft={...initial.data.settings,liveOrigin:'https://www.tangierexcursions.com/',google:{...initial.data.settings.google,clientId:'public-client-id'},email:{...initial.data.settings.email,senderEmail:'accounts@example.com'}};
 const saved=await request(draft);assert.equal(saved.status,200);assert.ok(saved.data.settings.revision);assert.equal(saved.data.settings.liveOrigin,'https://www.tangierexcursions.com');assert.equal(saved.data.status.enabled,false);assert.equal(saved.data.status.google,false);assert.equal(saved.data.status.facebook,false);assert.equal(saved.data.status.email,false);
 const reloaded=await request();assert.deepEqual(reloaded.data.settings,saved.data.settings);
 console.log('PASS durable save/reload with inactive connections');
 assert.equal((await request(draft)).status,400);
 const next=await request({...saved.data.settings,facebook:{...saved.data.settings.facebook,planned:false}});assert.equal(next.status,200);assert.notEqual(next.data.settings.revision,saved.data.settings.revision);
 assert.equal((await request(saved.data.settings)).status,400);
 console.log('PASS stale saves cannot overwrite newer settings');
 for(const invalid of [
  {...next.data.settings,liveOrigin:'http://example.com'},
  {...next.data.settings,google:{...next.data.settings.google,callbackUrl:'javascript:alert(1)'}},
  {...next.data.settings,email:{...next.data.settings.email,senderEmail:'invalid'}},
  {...next.data.settings,email:{...next.data.settings.email,verificationMinutes:0}},
  {...next.data.settings,google:{...next.data.settings.google,clientSecret:'must-not-store'}}
 ])assert.equal((await request(invalid)).status,400);
 assert.deepEqual((await request()).data.settings,next.data.settings);
 const emailCount=await database.prepare("SELECT COUNT(*) AS n FROM records WHERE kind='email'").first();assert.equal(emailCount.n,0);
 console.log('PASS invalid settings and secrets rejected; no emails sent');
} finally { await mf.dispose(); }
