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


 const baseline=await api('about-admin');assert.equal(baseline.status,200);const original=baseline.data.draft;
 assert.equal(original.sections.length,12);assert.ok(original.sections.find(s=>s.type==='story').body.includes('Tangier Excursions grew from that connection.'));assert.equal(original.team.length,0);
 assert.equal((await api('about-admin',undefined,'guest')).status,403);pass('Structured source copy and admin authorization');
 let html=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(html.includes('Travel Morocco With People Who Know It'));assert.ok(html.includes('Spain and Morocco, Connected Properly'));assert.ok(!html.includes('about-editorial-grid'));assert.ok(html.includes('srcSet=')||html.includes('srcset='));assert.ok(html.includes('noindex'));
 const canonical=html.match(/<link[^>]+rel="canonical"[^>]*>/)?.[0];assert.ok(canonical?.includes('https://www.tangierexcursions.com/about-us/'));pass('New server-rendered editorial layout, responsive images and preserved canonical');
 const edited=structuredClone(original);edited.sections.find(s=>s.type==='hero').heading='QA draft only';edited.sections.find(s=>s.type==='story').body='<p>A <strong>reviewed</strong> story.</p><script>alert(1)</script><img src=x onerror=alert(1)><p><a href="javascript:alert(1)">unsafe</a></p>';edited.sections.find(s=>s.type==='local').enabled=false;edited.values[0].title='QA Local knowledge';edited.team=[{id:'qa-person',name:'QA test fixture',role:'Test guide',bio:'This is a disposable test profile.',languages:'English',speciality:'Test route',visible:false,photo:{url:'',alt:'',demo:true,x:50,y:50}}];const first=edited.sections.splice(4,1)[0];edited.sections.splice(2,0,first);
 let result=await api('about-save',{action:'draft',document:edited});assert.equal(result.status,200);assert.ok(!result.data.sections.find(s=>s.type==='story').body.includes('script'));assert.ok(!result.data.sections.find(s=>s.type==='story').body.includes('javascript'));assert.ok(result.data.sections.find(s=>s.type==='story').body.includes('<strong>reviewed</strong>'));const revision=result.data.revision;
 html=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(!html.includes('QA draft only'));
 let current=await api('about-admin');assert.equal(current.data.draft.sections[2].type,'private');assert.equal(current.data.draft.values[0].title,'QA Local knowledge');assert.equal(current.data.draft.team[0].visible,false);pass('Draft persistence, section order, visibility, values, team and rich-text sanitization');
 const preview=await mf.dispatchFetch('http://test.local/admin/about-preview/',{headers:{'oai-authenticated-user-id':'test-admin','oai-authenticated-user-email':'admin@example.test'}});assert.equal(preview.status,200);assert.ok((await preview.text()).includes('QA draft only'));assert.equal((await mf.dispatchFetch('http://test.local/admin/about-preview/')).status,404);pass('Authenticated draft preview with private content separation');
 assert.equal((await api('about-save',{action:'publish',document:edited})).status,400);
 result=await api('about-save',{action:'publish',confirm:true,expectedRevision:revision,document:edited});assert.equal(result.status,200);
 html=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(html.includes('QA draft only'));assert.ok(!html.includes('<h2>Morocco Is Not Just Where We Work</h2>'));assert.ok(html.includes(canonical));assert.ok(!html.includes('QA test fixture'));pass('Reviewed publication, hidden sections and unchanged SEO');
 current=await api('about-admin');const old=current.data.revisions.find(r=>r.action==='Before publication');assert.ok(old);const restored=await api('about-save',{action:'restore',id:old.id});assert.equal(restored.status,200);assert.equal(restored.data.sections.find(s=>s.type==='hero').heading,original.sections.find(s=>s.type==='hero').heading);assert.ok(await database.prepare("SELECT value FROM settings WHERE key='about:legacy-source'").first());pass('Revision restore creates draft and retains original migration source');
 assert.equal((await api('about-save',{action:'draft',document:edited},'guest')).status,403);
 const bad=structuredClone(edited);bad.sections[0].image.url='https://temporary.example/image.jpg';assert.equal((await api('about-save',{action:'draft',document:bad})).status,400);pass('Write authorization and permanent-media validation');
 const seo=await api('seo-platform-admin');assert.ok(seo.data.pages.some(p=>p.path==='/about-us/'));assert.equal(seo.data.profiles['/about-us/'].canonical,'https://www.tangierexcursions.com/about-us/');pass('Existing unified SEO profile remains authoritative');

 const tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';const stamp=new Date().toISOString();
 await database.prepare('INSERT INTO bookings(id,owner,tour,date,guests,total,status,token,data,created,request_key) VALUES (?,?,?,?,?,?,?,?,?,?,?)').bind('about-booking','qa-owner',tour,'2026-01-01',2,20000,'completed','about-token','{}',stamp,'about-key').run();
 await database.prepare('INSERT INTO records(id,kind,owner,data,created) VALUES (?,?,?,?,?)').bind('review:about-booking','review','qa-owner',JSON.stringify({publicId:'about-approved-review',status:'published',rating:5,name:'QA approved guest',title:'A test review',text:'QA genuine review record.',photos:[],publicationConsent:true}),stamp).run();
 const reviews=await api('about-admin');assert.ok(reviews.data.reviews.some(r=>r.id==='about-approved-review'));let publicPage=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(publicPage.includes('QA genuine review record.'));
 await database.prepare("UPDATE records SET data=json_set(data,'$.status','pending-review') WHERE id='review:about-booking'").run();publicPage=await (await mf.dispatchFetch('http://test.local/about-us/')).text();assert.ok(!publicPage.includes('QA genuine review record.'));pass('Guest voices use approved booking reviews and respect moderation changes');
 const assets=original.sections.flatMap(s=>[s.image,s.secondaryImage]).filter(p=>p.url);const manifest=JSON.parse(fs.readFileSync('data/responsive-images.json','utf8'));for(const photo of assets){assert.ok(fs.existsSync('public'+photo.url));assert.ok(manifest[photo.url]?.srcSet);for(const src of manifest[photo.url].srcSet.split(',').map(x=>x.trim().split(' ')[0]))assert.ok(fs.existsSync('public'+src));}pass('All story photos and optimized responsive derivatives exist');

 assert.equal((await api('newsletter-subscribe',{email:'test@example.test',consent:false})).status,400);
 assert.equal((await api('newsletter-subscribe',{email:' Test@example.test ',consent:true},'guest')).status,200);
 await api('newsletter-subscribe',{email:'test@example.test',consent:true},'guest');
 const subscribed=await api('about-admin');assert.equal(subscribed.data.subscribers.length,1);const subscriber=subscribed.data.subscribers[0];assert.equal(subscriber.data.email,'test@example.test');
 assert.equal((await api('newsletter-remove',{id:subscriber.id},'guest')).status,403);
 assert.equal((await api('newsletter-remove',{id:subscriber.id})).status,200);
 assert.equal((await api('about-admin')).data.subscribers[0].data.status,'unsubscribed');pass('Newsletter consent, persistent deduplication, private admin list and unsubscribe');
 assert.ok(html.includes('about-connect'));assert.ok(html.includes('about-find-launch'));pass('Company/newsletter and discovery rendered within About');
 console.log('TOTAL' ,checks.length);
}finally{await mf.dispose()}
