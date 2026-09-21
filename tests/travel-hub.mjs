import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url),wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare'),root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'seo-test-database'},r2Buckets:{MEDIA:'seo-test-media'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const checks=[];const pass=n=>{checks.push(n);console.log('PASS',n)};
try{
 const database=await mf.getD1Database('DB');for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function api(op,body,user='test-admin'){const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers:{'Content-Type':'application/json',Origin:'http://test.local','oai-authenticated-user-id':user,'oai-authenticated-user-email':user+'@example.test'},...(body===undefined?{}:{body:JSON.stringify(body)})});const raw=await r.text(),data=raw?JSON.parse(raw):{};return {status:r.status,data}}

 const admin=await api('hub-admin');assert.equal(admin.status,200);assert.ok(admin.data.faqs.length>20);
 assert.equal((await api('hub-admin',undefined,'guest')).status,403);pass('Hub admin authorization');
 const faq={kind:'faq',id:'qa-hub',question:'QA persistence question?',shortAnswer:'A saved answer.',category:'QA',published:false,order:1,relatedTours:[],relatedPages:[]};
 assert.equal((await api('hub-save',faq)).status,200);assert.equal((await api('hub-admin')).data.faqs.find(f=>f.id==='qa-hub').published,false);
 let html=await (await mf.dispatchFetch('http://test.local/faqs/')).text();assert.ok(html.includes('Frequently Asked Questions'));assert.ok(!html.includes('QA persistence question?'));assert.ok(html.includes('How do I book a tour?'));
 assert.equal((await api('hub-save',{...faq,published:true})).status,200);html=await (await mf.dispatchFetch('http://test.local/faqs/')).text();assert.ok(html.includes('QA persistence question?'));pass('FAQ draft/publish and server-rendered answer persistence');
 const term=admin.data.discovery.terms.find(t=>t.kind==='destination'&&!t.seoUrl&&t.count>0);
 const dest={kind:'destination',id:term.id,slug:'qa-destination',country:term.country,region:'QA region',longDescription:'A useful destination introduction. '.repeat(12),published:true,relatedBlog:[]};
 assert.equal((await api('hub-save',dest)).status,200);let detail=await mf.dispatchFetch('http://test.local/destinations/qa-destination/');assert.equal(detail.status,200);assert.ok((await detail.text()).includes('A useful destination introduction.'));
 assert.equal((await api('hub-save',{...dest,slug:'changed'})).status,400);pass('Destination persistence, reusable detail route and protected URL');
 let directory=await mf.dispatchFetch('http://test.local/destinations/');assert.equal(directory.status,200);html=await directory.text();assert.ok(html.includes('Explore Morocco'));assert.ok(html.includes('QA region'));assert.ok(html.includes('noindex'));pass('Crawlable destination directory and staging noindex');
 const enquiry={category:'Existing Booking',name:'QA Guest',email:'qa@example.test',reference:'QA-BOOKING',message:'Please confirm the pickup.',consent:true};
 let result=await api('contact-enquiry',enquiry,'guest');assert.equal(result.status,200);const id=result.data.id;
 assert.ok((await api('hub-admin')).data.enquiries.some(x=>x.id===id));assert.equal((await api('hub-enquiry',{id,status:'in-progress',assigned:'Operations',internalNotes:'QA note'})).status,200);assert.equal((await api('hub-admin')).data.enquiries.find(x=>x.id===id).data.internalNotes,'QA note');pass('Conditional contact validation, inbox persistence and staff notes');
 assert.equal((await api('contact-enquiry',{...enquiry,reference:''},'guest')).status,400);
 assert.equal((await api('hub-save',faq,'guest')).status,403);
 assert.equal((await api('faq-feedback',{id:'qa-hub',helpful:'yes',consent:true},'guest')).status,200);pass('Enquiry validation, write authorization and helpful feedback');
 const seo=await api('seo-platform-admin');assert.ok(seo.data.pages.some(p=>p.path==='/destinations/'));assert.ok(seo.data.profiles['/faqs/'].aeoQuestions.some(x=>x.id==='qa-hub'));pass('Unified SEO and shared AEO integration');
 const about=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(about.includes('about-story'));assert.ok(about.includes('Travel Morocco With People Who Know It'));pass('About editorial imagery and approved replacement copy');
 const date=new Date(Date.now()+86400000*7).toISOString().slice(0,10);const availability=await api('hub-availability?date='+date);assert.equal(availability.status,200);assert.ok(Array.isArray(availability.data.paths));assert.equal((await api('hub-availability?date=not-a-date')).status,400);pass('Destination date availability and invalid-date rejection');
 await api('hub-save',{...faq,published:true,relatedPages:['/about-us/']});const shared=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(shared.includes('QA persistence question?'));pass('Shared FAQ reuse on assigned page');
 console.log('TOTAL',checks.length);
}finally{await mf.dispose()}
