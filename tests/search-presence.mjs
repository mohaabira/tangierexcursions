import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},r2Buckets:{MEDIA:'test-media'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const evidence=[];
const record=(name)=>{evidence.push({name,status:'passed'});console.log('PASS',name)};
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function request(op,body,user='test-customer'){const headers={'Content-Type':'application/json',Origin:'http://test.local'};if(user){headers['oai-authenticated-user-id']=user;headers['oai-authenticated-user-email']=user+'@example.test'}const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers,...(body===undefined?{}:{body:JSON.stringify(body)})});const raw=await r.text();if(!raw)throw new Error('Empty '+r.status+' response for '+op+' '+JSON.stringify([...r.headers]));const data=JSON.parse(raw);return {status:r.status,data}}
 const tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';const date='2027-06-15';
 let r=await request('presence-admin',undefined,'test-customer');assert.equal(r.status,403);record('Search presence dashboard is admin-only');
 r=await request('presence-admin',undefined,'test-admin');assert.equal(r.status,200);const source=r.data.pages.find(p=>p.path===tour);assert.ok(source.title);assert.ok(source.canonical);assert.ok(source.schema.length);record('Admin exposes preserved metadata, canonical and schema');
 const profile={path:tour,summary:'QA factual summary',questions:[{question:'QA traveler question?',answer:'QA reviewed answer.'}],sources:[{label:'QA source',url:'https://example.com/facts'}],reviewer:'QA editor',reviewed:false};assert.equal((await request('presence-save',profile,'test-customer')).status,403);assert.equal((await request('presence-save',profile,'test-admin')).status,200);let html=await (await mf.dispatchFetch('http://test.local'+tour)).text();assert.ok(!html.includes('<p>QA factual summary</p>'));record('Draft answers persist but stay out of visible page content');
 await request('presence-save',{...profile,reviewed:true},'test-admin');html=await (await mf.dispatchFetch('http://test.local'+tour)).text();assert.ok(html.includes('<p>QA factual summary</p>'));assert.ok(html.includes('QA reviewed answer.'));assert.ok(html.includes('https://example.com/facts'));const fresh=(await request('presence-admin',undefined,'test-admin')).data;assert.equal(fresh.profiles[tour].reviewer,'QA editor');assert.deepEqual(fresh.pages.find(p=>p.path===tour),source);record('Reviewed answers render on the existing page while original SEO remains unchanged');
 assert.equal((await request('presence-save',{...profile,sources:[{label:'Bad',url:'javascript:alert(1)'}]},'test-admin')).status,400);assert.equal((await request('presence-save',{...profile,reviewed:true,reviewer:''},'test-admin')).status,400);await request('presence-save',{...profile,summary:'',questions:[],sources:[],reviewed:false},'test-admin');assert.equal((await request('presence-admin',undefined,'test-admin')).data.profiles[tour].questions.length,0);record('Unsafe sources and unreviewed publication rejected; clearing content persists');
 assert.ok(!html.includes('golden-source-links'));assert.ok(html.includes('Rating not recorded'));assert.ok(html.includes('compact-card-meta'));record('Tour output removes further-reading block and preserves honest review ratings');
 fs.writeFileSync('migration/search-presence-test-results.json',JSON.stringify({passed:evidence.length,checks:evidence},null,2));
}finally{await mf.dispose()}
