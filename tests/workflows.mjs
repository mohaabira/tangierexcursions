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
 let r=await request('quote',{tour,date,guests:4,currency:'EUR'});assert.equal(r.status,200);assert.equal(r.data.total,34800);record('Published Tarifa quote: four travelers = EUR 348');
 r=await request('quote',{tour,date:'2027-02-31',guests:4,currency:'EUR'});assert.equal(r.status,400);record('Impossible dates rejected');
 r=await request('admin',undefined,'test-customer');assert.equal(r.status,403);record('Customer denied administration');
 r=await request('booking',{tour,date,guests:4,currency:'USD',name:'QA Traveler',email:'qa@example.test',pickup:'Test hotel',accepted:true,requestKey:'qa-idempotency-001',total:1});assert.equal(r.status,200);assert.equal(r.data.total,34800);const booking=r.data;record('Booking ignores client amount and records authoritative EUR total');
 r=await request('booking',{tour,date,guests:4,currency:'USD',name:'QA Traveler',email:'qa@example.test',accepted:true,requestKey:'qa-idempotency-001'});assert.equal(r.data.id,booking.id);record('Duplicate confirmation is idempotent');
 r=await request('account',undefined,'other-customer');assert.equal(r.data.bookings.length,0);record('Customer booking isolation');
 r=await request('verify?token='+booking.token,undefined,null);assert.equal(r.status,403);record('Voucher details require authenticated staff');
 r=await request('verify?token='+booking.token,undefined,'test-admin');assert.equal(r.data.valid,true);assert.equal(r.data.guests,4);assert.equal(r.data.email,undefined);record('Staff voucher verification returns minimal operational data');
 r=await request('wishlist',{path:tour,saved:true});assert.equal(r.status,200);r=await request('account');assert.equal(r.data.wishlist.length,1);assert.equal(r.data.emails.length,1);record('Wishlist and branded test outbox persist');
 r=await request('cancel',{id:booking.id});assert.equal(r.status,200);r=await request('verify?token='+booking.token,undefined,'test-admin');assert.equal(r.status,404);record('Cancellation revokes existing QR token');
 r=await request('lead',{name:'QA Enquiry',email:'qa@example.test',start:'Tangier',destinations:'Fes',guests:'2',consent:true},null);assert.equal(r.status,200);r=await request('admin',undefined,'test-admin');assert.equal(r.data.leads.length,1);record('Custom enquiry appears in staff dashboard');
 r=await request('tour-settings',{path:tour,tiers:[{min:1,max:99,price:100}],capacity:4,blackouts:[]},'test-admin');assert.equal(r.status,200);
 const book=(key)=>request('booking',{tour,date:'2027-07-01',guests:3,currency:'EUR',name:'QA',email:'qa@example.test',accepted:true,requestKey:key});
 const concurrent=await Promise.all([book('capacity-test-001'),book('capacity-test-002')]);assert.equal(concurrent.filter(x=>x.status===200).length,1);record('Concurrent bookings cannot exceed capacity');
 r=await request('test-session',{role:'admin'},null);assert.equal(r.status,404);record('Development identity switch disabled in production build');
 for(const route of ['/',tour,'/about-us/','/morocco-travel-blog/']){const response=await mf.dispatchFetch('http://test.local'+route);assert.equal(response.status,200);const html=await response.text();assert.ok(html.includes('noindex'));assert.ok(html.includes('canonical'));}record('Representative routes render with canonical metadata and noindex');
 const response=await mf.dispatchFetch('http://test.local/not-an-existing-tour/');assert.equal(response.status,404);record('Unknown routes return real 404');
 fs.writeFileSync('migration/workflow-test-results.json',JSON.stringify(evidence,null,2));
}finally{await mf.dispose()}
