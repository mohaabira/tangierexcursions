import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},bindings:{ADMIN_USER_IDS:'test-admin',MARKETING_ENVIRONMENT:'staging'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const jar={};
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function request(op,body,user='test-admin',useJar=true){const headers={'Content-Type':'application/json',Origin:'http://test.local'};if(user){headers['oai-authenticated-user-id']=user;headers['oai-authenticated-user-email']=user+'@example.test'}if(useJar)headers.Cookie=Object.entries(jar).map(([k,v])=>k+'='+v).join('; ');const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers,...(body===undefined?{}:{body:JSON.stringify(body)})});for(const c of r.headers.getSetCookie()){const [k,v]=c.split(';')[0].split('=');if(v)jar[k]=v;else delete jar[k]}const raw=await r.text();return {status:r.status,data:raw?JSON.parse(raw):null};}
 const event=(name='view_home',extra={})=>request('marketing-event',{event_id:crypto.randomUUID(),name,path:'/',query:'?utm_source=google&utm_medium=cpc&utm_campaign=may',referrer:'https://google.com/search?q=secret',...extra},null);
 assert.equal((await event()).data.recorded,false);
 await request('marketing-consent',{analytics:true},null);assert.equal((await event()).data.recorded,false);
 let r=await request('marketing-admin?mode=settings');assert.equal(r.status,200);await request('marketing-admin',{action:'settings',value:{...r.data,debugTracking:true}});
 const id=crypto.randomUUID();r=await event('view_home',{event_id:id,context:{passport:'never',email:'never@example.test'}});assert.equal(r.data.recorded,true);await event('view_home',{event_id:id});
 assert.equal((await database.prepare('SELECT COUNT(*) n FROM marketing_events').first()).n,1);
 let visitor=await database.prepare('SELECT * FROM marketing_visitors').first();assert.equal(JSON.parse(visitor.first_touch).source,'google');assert.equal(JSON.parse(visitor.first_touch).referrer,'google.com');assert.ok(!JSON.stringify(await database.prepare('SELECT * FROM marketing_events').all()).includes('never'));
 await event('view_page',{path:'/about-us/',query:'',referrer:''});await event('view_home',{query:'?utm_source=facebook&utm_medium=social',referrer:''});
 visitor=await database.prepare('SELECT * FROM marketing_visitors').first();assert.equal(JSON.parse(visitor.first_touch).source,'google');assert.equal(JSON.parse(visitor.last_touch).source,'facebook');assert.equal((await database.prepare('SELECT COUNT(*) n FROM marketing_sessions').first()).n,1);
 const tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';
 await event('view_trip',{path:tour,query:'',referrer:''});await event('start_booking',{path:tour,query:'',referrer:''});
 r=await request('lead',{name:'QA Person',email:'qa@example.test',consent:true,type:'custom',notes:'TEST ONLY'});assert.equal(r.status,200);const lead=r.data.id;
 assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_conversions WHERE kind='lead'").first()).n,1);
 r=await request('lead',{name:'QA Tour',email:'tour@example.test',consent:true,type:'tour',tour});assert.equal(r.status,200);assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='submit_enquiry'").first()).n,1);
 r=await request('contact-enquiry',{name:'QA Person',email:'qa@example.test',message:'Test enquiry',consent:true,category:'General Enquiry'});assert.equal(r.status,200);
 const input={tour,date:'2027-06-18',adults:2,children:0,currency:'EUR',name:'QA Traveler',email:'qa@example.test',accepted:true,requestKey:'marketing-test-01'};
 r=await request('booking',input,'test-customer');assert.equal(r.status,200,JSON.stringify(r.data));const booking=r.data.id;assert.equal(r.data.status,'test-confirmed');
 const attribution=await database.prepare("SELECT * FROM marketing_conversions WHERE kind='booking' AND target=?").bind(booking).first();assert.equal(JSON.parse(attribution.first_touch).source,'google');assert.equal(JSON.parse(attribution.last_touch).source,'facebook');
 assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='booking_confirmed'").first()).n,1);
 await request('booking',input,'test-customer');assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='booking_confirmed'").first()).n,1);
 const total=r.data.total,deposit=r.data.data.deposit;
 r=await request('booking-payment',{id:booking,kind:'payment',amount:deposit,reason:'QA simulation',requestKey:'marketing-payment-01'});assert.equal(r.status,200,JSON.stringify(r.data));
 assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='deposit_paid'").first()).n,1);
 await request('booking-payment',{id:booking,kind:'payment',amount:deposit,reason:'QA duplicate',requestKey:'marketing-payment-01'});assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='deposit_paid'").first()).n,1);
 await request('booking-payment',{id:booking,kind:'refund',amount:deposit,reason:'QA refund',requestKey:'marketing-refund-01'});assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='refund_completed'").first()).n,1);
 r=await request('marketing-admin?environment=production');assert.equal(r.data.operational.bookings,0);assert.equal(r.data.bookedValue,0);
 r=await request('marketing-admin?environment=staging');assert.equal(r.data.bookings,1);assert.equal(r.data.bookedValue,total);assert.equal(r.data.revenue.source.facebook,total);
 await request('booking-status',{id:booking,status:'cancelled'});assert.equal((await database.prepare("SELECT COUNT(*) n FROM marketing_events WHERE name='booking_cancelled'").first()).n,1);
 r=await request('marketing-admin?environment=staging');assert.equal(r.data.bookedValue,0);
 // Staff-created custom booking inherits the stored lead snapshot without staff tracking consent.
 await request('marketing-consent',{analytics:false},null);
 r=await request('booking',{...input,bookingType:'CUSTOM_TOUR',customTourId:lead,requestKey:'marketing-custom-01'});assert.equal(r.status,200,JSON.stringify(r.data));const inherited=await database.prepare("SELECT * FROM marketing_conversions WHERE kind='booking' AND target=?").bind(r.data.id).first();assert.equal(JSON.parse(inherited.first_touch).source,'google');assert.equal(JSON.parse(inherited.last_touch).source,'facebook');await request('booking-status',{id:r.data.id,status:'cancelled'});
 await request('marketing-consent',{analytics:true},null);await event();
 const oldSession=jar.te_session;await database.prepare('UPDATE marketing_sessions SET last_seen=?').bind('2020-01-01T00:00:00.000Z').run();await event();assert.notEqual(jar.te_session,oldSession);
 await request('marketing-consent',{analytics:false},null);assert.ok(!jar.te_visitor);const before=(await database.prepare('SELECT COUNT(*) n FROM marketing_events').first()).n;await event();assert.equal((await database.prepare('SELECT COUNT(*) n FROM marketing_events').first()).n,before);
 assert.equal((await event('booking_confirmed')).data.recorded,false);
 // Retention affects only analytics records, not the booking ledger.
 await database.prepare("INSERT INTO marketing_events(id,name,created,environment,context) VALUES('expired-qa','view_home','2020-01-01T00:00:00.000Z','staging','{}')").run();
 await request('marketing-admin',{action:'retention'});assert.equal(await database.prepare("SELECT id FROM marketing_events WHERE id='expired-qa'").first(),null);assert.ok(await database.prepare('SELECT id FROM bookings WHERE id=?').bind(booking).first());
 // Draft is private, noindex, editable; publication and indexing are independent.
 const landing={path:'/qa-marketing-landing/',name:'QA landing',intro:'Travel information',editorial:{html:'<h2>Plan your journey</h2><p>Reviewed body.</p>',relatedTours:[tour]},landing:{faqs:[{question:'Private?',answer:'Yes'}],destinations:[],links:[],cta:{label:'Explore',url:'/destinations/'}}};
 r=await request('marketing-admin',{action:'landing',value:landing});assert.equal(r.status,200,JSON.stringify(r.data));assert.equal(r.data.reviewed,false);
 let registry=(await request('marketing-admin?mode=content')).data;let item=registry.find(p=>p.path===landing.path);assert.equal(item.draft,true);assert.equal(item.sitemap,false);assert.equal(item.seo.index,false);
 await request('marketing-admin',{action:'landing',value:{...landing,reviewed:true}});registry=(await request('marketing-admin?mode=content')).data;item=registry.find(p=>p.path===landing.path);assert.equal(item.draft,false);assert.equal(item.seo.index,false);assert.equal(item.sitemap,false);
 r=await request('seo-save',{...item.seo,path:landing.path,index:true,status:'published',confirmProtected:true});assert.equal(r.status,400);
 landing.intro='A reviewed and original introduction for this test journey, explaining the travel route and practical information travelers need before choosing their experience.';landing.image='/assets/brand/primary.png';landing.imageAlt='Tangier Excursions logo';landing.editorial.html+='<p>'+Array.from({length:140},(_,i)=>'planning-detail-'+i).join(' ')+'</p>';landing.landing.destinations=['/destinations/'];landing.landing.faqs=[{question:'How do I review the itinerary?',answer:'Read the route and inclusions carefully, then ask the team to clarify any uncertainty before booking.'}];await request('marketing-admin',{action:'landing',value:{...landing,reviewed:true}});
 r=await request('seo-save',{...item.seo,path:landing.path,index:true,sitemap:true,status:'published',title:'Manual SEO title',description:'Manual summary',confirmProtected:true});assert.equal(r.status,200,JSON.stringify(r.data));
 registry=(await request('marketing-admin?mode=content')).data;item=registry.find(p=>p.path===landing.path);assert.equal(item.seo.title,'Manual SEO title');assert.equal(item.sitemap,true);const html=await (await mf.dispatchFetch('http://test.local'+landing.path)).text();assert.ok(html.includes('Manual SEO title'));assert.ok(html.includes('Frequently asked questions'));assert.ok(html.includes('Reviewed body.'));
 const xml=await (await mf.dispatchFetch('http://test.local/landing-sitemap.xml')).text();assert.ok(xml.includes(landing.path));assert.ok(!xml.includes('/account/'));
 await request('marketing-admin',{action:'relationship',value:{from:landing.path,to:tour}});registry=(await request('marketing-admin?mode=content')).data;assert.equal(registry.find(p=>p.path===landing.path).related.length,1);
 assert.equal((await request('marketing-admin',undefined,'test-customer')).status,403);assert.notEqual((await request('marketing-admin',{action:'settings',value:{}},'test-customer')).status,200);
 // Analytics unavailable must not prevent booking or lead submission.
 await request('marketing-consent',{analytics:true},null);await event();await database.prepare('DROP TABLE marketing_conversions').run();await database.prepare('DROP TABLE marketing_events').run();r=await request('booking',{...input,requestKey:'marketing-failure-01'},'test-customer');assert.equal(r.status,200,JSON.stringify(r.data));r=await request('lead',{name:'QA Person',email:'qa@example.test',consent:true,type:'custom'});assert.equal(r.status,200);
 console.log('PASS consent, environment isolation, idempotence, first/last attribution, lead/contact/booking linkage, trusted payment/refund/cancellation, session expiry, draft/noindex/publish, manual SEO, sitemap, relationships, permissions, booking and enquiry failure isolation');
}finally{await mf.dispose()}
