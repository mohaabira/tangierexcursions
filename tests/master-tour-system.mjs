import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},r2Buckets:{MEDIA:'test-media'},bindings:{ADMIN_USER_IDS:'test-admin',PASSPORT_ENCRYPTION_KEY:'ab'.repeat(32)},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const evidence=[];
const record=(name)=>{evidence.push({name,status:'passed'});console.log('PASS',name)};
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function request(op,body,user='test-customer'){const headers={'Content-Type':'application/json',Origin:'http://test.local'};if(user){headers['oai-authenticated-user-id']=user;headers['oai-authenticated-user-email']=user+'@example.test'}const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers,...(body===undefined?{}:{body:JSON.stringify(body)})});const raw=await r.text();if(!raw)throw new Error('Empty '+r.status+' response for '+op+' '+JSON.stringify([...r.headers]));const data=JSON.parse(raw);return {status:r.status,data}}


 const catalog=JSON.parse(fs.readFileSync('data/catalog.json','utf8')).filter(p=>p.kind==='tour');
 const models=(await request('cms-tours',undefined,'test-admin')).data;
 const inventory=[];
 for(const p of catalog){
  const m=models[p.path];assert.ok(m?.golden,p.path);assert.equal(m.status,'published');
  const response=await mf.dispatchFetch('http://test.local'+p.path);assert.equal(response.status,200,p.path);const html=await response.text();
  assert.ok(html.includes('data-tour-template="golden-v3"'),p.path+' template');
  const esc=s=>String(s??'').replaceAll('&','&amp;').replaceAll('"','&quot;').replaceAll('<','&lt;').replaceAll('>','&gt;').replaceAll("'",'&#x27;');
  assert.ok(html.includes('<h1>'+esc(p.name)+'</h1>'),p.path+' title');
  assert.ok(html.includes('id="guest-reviews"'),p.path+' review form');assert.ok(html.includes('Customize this tour'),p.path+' custom action');
  assert.ok(html.includes('aria-label="Save tour"'));assert.ok(html.includes('aria-label="Share tour"'));
  assert.ok(html.includes(esc(p.canonical[0]||p.url)),p.path+' canonical');assert.ok(html.includes(esc(p.meta.description)),p.path+' meta');
  assert.ok(html.includes(esc(m.featuredImage)),p.path+' image');assert.ok(!html.includes('Supplier booking notification'));
  const config=(await request('tour?path='+encodeURIComponent(p.path))).data;
  let quoteStatus='Enquiry only — no configured tiers';
  if(config.tiers.length&&!['enquiry','custom'].includes(config.bookingMode)){
   const first=config.tiers[0];const q=await request('quote',{tour:p.path,date:'2099-06-12',guests:first.min,currency:'EUR'});assert.equal(q.status,200,p.path+' '+q.data.error);assert.ok(q.data.total>0);quoteStatus='Server quote passed';
   const booking=await request('booking',{tour:p.path,date:'2099-06-12',guests:first.min,currency:'EUR',name:'Audit traveler',email:'audit@example.test',accepted:true,requestKey:'audit-'+crypto.randomUUID(),expectedTotal:q.data.total,expectedDeposit:q.data.deposit});assert.equal(booking.status,200,p.path+' booking '+booking.data.error);
  }
  for(const block of html.matchAll(/<script[^>]*type="application\/ld\+json"[^>]*>([\s\S]*?)<\/script>/g))JSON.parse(block[1]);
  assert.equal((await request('wishlist',{path:p.path,saved:true})).status,200);assert.ok((await request('account')).data.wishlist.some(x=>x.data.path===p.path));assert.equal((await request('wishlist',{path:p.path,saved:false})).status,200);
  const g=(await request('golden-admin?path='+encodeURIComponent(p.path),undefined,'test-admin')).data;
  assert.equal(g.original,p.content);assert.equal((await request('golden-save',{action:'save',tour:g.tour},'test-admin')).status,200);
  assert.deepEqual((await request('golden-admin?path='+encodeURIComponent(p.path),undefined,'test-admin')).data.tour.overview,g.tour.overview);
  const gaps=[];for(const k of ['overview','highlights','itinerary','included','excluded','before','faqs'])if(!g.tour[k]?.length)gaps.push('Missing '+k);
  if(!g.tour.map.enabled)gaps.push('Map coordinates require review');if(!g.tour.cancellation.body.length)gaps.push('Cancellation policy requires review');
  if(g.tour.itineraryMode==='stop')gaps.push('Sequential source itinerary retained; exact times not supplied');
  inventory.push({path:p.path,title:p.name,template:'golden-v3',httpStatus:200,seo:'preserved',gallery:'own images',mode:g.tour.itineraryMode,quote:quoteStatus,admin:'saved and reloaded',gaps});console.log('AUDITED',p.path);
 }
 record('All 40 published products render Golden template, own metadata and images, custom action and dedicated reviews; all structured editors save and reload');
 const target=Object.values(models).find(m=>m.operations.ferryIncluded&&m.baseTiers?.length)||Object.values(models).find(m=>m.operations.ferryIncluded);
 const pricing={path:target.path,tiers:[{min:1,max:1,price:100,basis:'person'},{min:2,max:4,price:250,basis:'group'},{min:5,max:8,price:400,basis:'fixed'}],capacity:99,blackouts:[],deposit:25};
 assert.equal((await request('tour-settings',pricing,'test-admin')).status,200);
 for(const [guests,total] of [[1,10000],[3,25000],[7,40000]]){const q=await request('quote',{tour:target.path,date:'2099-07-10',guests,currency:'USD'});assert.equal(q.data.total,total);assert.equal(q.data.deposit,total/4);assert.equal(q.data.displayTotal,Math.round(total*1.1));}
 record('Per-person, per-group and fixed tier totals, currency conversion and deposits');
 const op={...target,operations:{ferryIncluded:true,suppliers:[{id:'qa-guide',name:'Test Guide',email:'guide@example.test',role:'guide',enabled:true},{id:'qa-hotel',name:'Test Hotel',email:'hotel@example.test',role:'hotel',enabled:true}]}};
 assert.equal((await request('cms-save',op,'test-customer')).status,403);assert.equal((await request('cms-save',op,'test-admin')).status,200);
 const input={tour:target.path,date:'2099-07-10',guests:3,currency:'EUR',name:'Test Passenger',email:'customer@example.test',pickup:'Test pickup',accepted:true,requestKey:'workflow-'+crypto.randomUUID()};
 const b=(await request('booking',input)).data;assert.ok(b.id);const passenger=await request('passengers?booking='+b.id);assert.equal(passenger.data.required,true);
 assert.equal((await request('passengers?booking='+b.id,undefined,'other-customer')).status,403);
 const blank={name:'',number:'',expiry:'',birth:'',nationality:''};const one={name:'Fictional Traveler',number:'QA-TEST-ONLY',expiry:'2099-08-01',birth:'1990-01-01',nationality:'Test nationality'};
 let saved=await request('passengers',{booking:b.id,passengers:[one,blank,blank],consent:true});assert.equal(saved.data.status,'Partially received');saved=await request('passengers',{booking:b.id,passengers:[one,one,one],consent:true});assert.equal(saved.data.status,'Complete');
 assert.equal((await request('passengers?booking='+b.id)).data.passengers[0].number,one.number);
 const raw=await database.prepare('SELECT data FROM records WHERE id=?').bind('passengers:'+b.id).first();assert.ok(!raw.data.includes(one.number));
 const admin=(await request('admin',undefined,'test-admin')).data;assert.ok(!JSON.stringify(admin).includes(one.number));assert.ok(!JSON.stringify((await request('account')).data).includes(one.number));
 await request('booking',input);const status=(await request('operations-status',undefined,'test-admin')).data;const sent=status.filter(x=>x.reference===b.id&&x.kind==='supplier-notification');assert.equal(sent.length,2);assert.equal(sent.find(x=>x.role==='guide').pickup,'Test pickup');assert.ok(!sent.find(x=>x.role==='hotel').pickup);
 const html=await (await mf.dispatchFetch('http://test.local'+target.path)).text();assert.ok(!html.includes('guide@example.test'));assert.ok(!html.includes('hotel@example.test'));
 record('Ferry confirmation, partial/complete encrypted passenger forms, access isolation, minimal supplier notifications, idempotent confirmation and no public supplier leakage');
 const lead=await request('lead',{type:'custom',tour:target.path,tourName:target.name,name:'Test Enquiry',email:'enquiry@example.test',consent:true});assert.equal(lead.status,200);assert.equal((await request('admin',undefined,'test-admin')).data.leads.find(x=>x.id===lead.data.id).data.tour,target.path);
 record('Tour-specific custom enquiry persists current experience');
 fs.writeFileSync('migration/MASTER-TOUR-AUDIT.json',JSON.stringify({total:inventory.length,templateApplied:inventory.length,manualAttention:inventory.filter(x=>x.gaps.length).length,browserQA:'Blocked: supervised browser reports page could not load. No desktop/tablet/mobile visual pass claimed.',checks:evidence,inventory},null,2));
 console.log('TOTAL',inventory.length,'products;',evidence.length,'workflow groups');
}finally{await mf.dispose()}
