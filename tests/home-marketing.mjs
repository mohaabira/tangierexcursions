import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const evidence=[];
const record=(name)=>{evidence.push({name,status:'passed'});console.log('PASS',name)};
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function request(op,body,user='test-customer'){const headers={'Content-Type':'application/json',Origin:'http://test.local'};if(user){headers['oai-authenticated-user-id']=user;headers['oai-authenticated-user-email']=user+'@example.test'}const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers,...(body===undefined?{}:{body:JSON.stringify(body)})});const raw=await r.text();if(!raw)throw new Error('Empty '+r.status+' response for '+op+' '+JSON.stringify([...r.headers]));const data=JSON.parse(raw);return {status:r.status,data}}
 const settings={enabled:true,eyebrow:'GIFT',heading:'QA gift heading',body:'A real journey',image:'/assets/hero/tangier-excursions-hero-poster.jpg',position:'right',cta:'Explore gifts',url:'/gifts/',newsletterEnabled:true,newsletterHeading:'Join our travels',newsletterBody:'Travel ideas'};
 let r=await request('home-marketing-save',settings,null);assert.equal(r.status,403);record('Anonymous users cannot change homepage offer');
 r=await request('home-marketing-save',settings,'test-admin');assert.equal(r.status,200);record('Admin saves all homepage offer fields');
 r=await request('config');assert.deepEqual(r.data.homeMarketing,settings);record('Saved offer survives a fresh settings read');
 r=await request('home-marketing-save',{...settings,url:'javascript:alert(1)'},'test-admin');assert.equal(r.status,400);record('Unsafe banner links rejected');
 r=await request('newsletter-subscribe',{email:'home@example.test',consent:false,source:'/'},null);assert.equal(r.status,400);record('Newsletter consent required');
 r=await request('newsletter-subscribe',{email:'home@example.test',consent:true,source:'/'},null);assert.equal(r.status,200);
 const row=await database.prepare("SELECT data FROM records WHERE kind='newsletter'").first();assert.equal(JSON.parse(row.data).source,'/');record('Homepage newsletter stores subscriber and correct source');
 const home=await mf.dispatchFetch('http://test.local/');assert.equal(home.status,200);const html=await home.text();assert.ok(html.includes('QA gift heading'));assert.ok(html.includes('home-newsletter'));assert.ok(!html.includes('THE MOROCCO JOURNAL'));record('Homepage renders saved offer and newsletter without blog carousel');
}finally{await mf.dispose()}
