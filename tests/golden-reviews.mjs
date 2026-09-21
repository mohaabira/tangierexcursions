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
 let r=await request('booking',{tour,date,adults:2,currency:'EUR',name:'Review QA',email:'review@example.test',accepted:true,requestKey:'golden-review-qa'});assert.equal(r.status,200);const booking=r.data;
 r=await request('review',{booking:booking.id,rating:3,text:'Honest test feedback',publicationConsent:true});assert.equal(r.status,400);record('Golden Tour reviews require a completed booking');
 r=await request('booking-status',{id:booking.id,status:'completed'},'test-admin');assert.equal(r.status,200);r=await request('review',{booking:booking.id,rating:3,text:'Honest test feedback',publicationConsent:true});assert.equal(r.status,200);r=await request('review-status',{id:'review:'+booking.id,status:'published'},'test-admin');assert.equal(r.status,200);r=await request('reviews?path='+encodeURIComponent(tour),undefined,null);assert.equal(r.data[0].rating,3);assert.equal(r.data[0].verified,true);assert.ok(r.data[0].date);record('Moderated booking reviews expose recorded rating, verification and date to the carousel');
 fs.writeFileSync('migration/golden-review-test-results.json',JSON.stringify({passed:evidence.length,checks:evidence},null,2));
}finally{await mf.dispose()}
