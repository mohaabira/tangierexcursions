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
 const tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';const date='2027-06-15';


 const config=(await request('tour?path='+encodeURIComponent(tour))).data;
 let r=await request('tour-settings',{...config,path:tour,pickupTimes:['10:00','09:00']},'test-admin');assert.equal(r.status,200);
 const saved=(await request('tour?path='+encodeURIComponent(tour))).data;assert.deepEqual(saved.pickupTimes,['09:00','10:00']);
 const input={tour,date,adults:2,children:1,currency:'EUR',name:'QA Traveler',email:'qa@example.test',accepted:true,requestKey:'pickup-booking-01'};
 assert.notEqual((await request('quote',input)).status,200);
 assert.notEqual((await request('booking',{...input,pickupTime:'11:00'})).status,200);
 r=await request('quote',{...input,pickupTime:'09:00'});assert.equal(r.status,200);assert.equal(r.data.pickupTime,'09:00');assert.ok(Number.isInteger(r.data.adultUnit));
 r=await request('booking',{...input,pickupTime:'09:00'});assert.equal(r.status,200);assert.equal(r.data.data.pickupTime,'09:00');assert.equal(r.data.data.pricingInput.pickupTime,'09:00');
 const detail=(await request('booking-detail?id='+r.data.id)).data;assert.equal(detail.booking.data.pickupTime,'09:00');
 assert.notEqual((await request('tour-settings',{...saved,path:tour,pickupTimes:['25:00']},'test-admin')).status,200);
 console.log('PASS pickup configuration, quote validation, booking persistence, detail and traveler rate fields');
}finally{await mf.dispose()}
