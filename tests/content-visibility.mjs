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

 const admin='test-admin', tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';
 const get=async path=>(await request('content-visibility?path='+encodeURIComponent(path),undefined,admin)).data;
 const html=async path=>await(await mf.dispatchFetch('http://test.local'+path)).text();
 assert.equal((await request('content-visibility?path='+encodeURIComponent(tour),undefined,null)).status,403);
 await request('staff',{roles:{'content-user':'content','finance-user':'finance'}},admin);
 assert.equal((await request('content-visibility?path='+encodeURIComponent(tour),undefined,'finance-user')).status,403);
 record('Visibility records are restricted to authorized editorial staff');
 for(const kind of ['page','article']){
  const path='/visibility-qa-'+kind+'/';
  const create=await request('page-create',{path,name:'Tangier visibility QA '+kind,kind,reviewed:true,image:'/media/featured-qa',imageAlt:'Sunset over Tangier harbor',intro:'A factual travel guide.',editorial:{html:'<h2>Plan your journey</h2><p>Visit our <a href="/tangier-day-trips/">Tangier day trips</a>.</p>',author:'Editorial QA',published:'2026-09-20'}},'content-user');assert.equal(create.status,200,JSON.stringify(create.data));
  const doc=(await request('page-document?path='+encodeURIComponent(path),undefined,admin)).data;assert.equal(doc.imageAlt,'Sunset over Tangier harbor');assert.equal(doc.image,'/media/featured-qa');
  let d=await get(path);assert.equal(d.image,'/media/featured-qa');
  let r=await request('seo-save',{...d.seo,title:'Reviewed Tangier search title '+kind,description:'A reviewed description about Tangier travel planning, routes and things visitors need to know before choosing their journey.',openGraph:{title:'Share Tangier '+kind,description:'Social preview description',image:''},twitter:{title:'',description:'',image:''},status:'published'},'content-user');assert.equal(r.status,200,JSON.stringify(r.data));
  let rendered=await html(path);assert.ok(rendered.includes('<title>Reviewed Tangier search title '+kind+'</title>'));assert.match(rendered,/property="og:image" content="https:\/\/www.tangierexcursions.com\/media\/featured-qa"/);assert.match(rendered,/name="twitter:card" content="summary_large_image"/);assert.match(rendered,/name="robots" content="noindex, nofollow"/);assert.ok(rendered.includes('Sunset over Tangier harbor'));
  if(kind==='article'){const schemas=[...rendered.matchAll(/<script[^>]*type="application\/ld\+json"[^>]*>(.*?)<\/script>/gs)].map(m=>JSON.parse(m[1]));const article=schemas.find(x=>x['@type']==='BlogPosting');assert.equal(article.author.name,'Editorial QA');assert.equal(article.image,'https://www.tangierexcursions.com/media/featured-qa')}
  record(kind+' featured image, alt text, published metadata and private noindex survive round trip');
  d=await get(path);r=await request('seo-save',{...d.seo,title:'HIDDEN SEO DRAFT',status:'draft'},admin);assert.equal(r.status,200);rendered=await html(path);assert.ok(!rendered.includes('<title>HIDDEN SEO DRAFT</title>'));record(kind+' draft search settings are not published');
  const facts={path,summary:'REVIEWED TRAVEL SUMMARY',questions:[{question:'Where does this journey start?',answer:'At the meeting point shown in your confirmed itinerary.'}],sources:[{label:'Official source QA',url:'https://www.tangierexcursions.com/'}],reviewer:'Review team',reviewed:false};
  r=await request('presence-save',facts,'content-user');assert.equal(r.status,200);rendered=await html(path);assert.ok(!rendered.includes('REVIEWED TRAVEL SUMMARY'));
  r=await request('presence-save',{...facts,reviewed:true},'content-user');assert.equal(r.status,200);rendered=await html(path);assert.ok(rendered.includes('REVIEWED TRAVEL SUMMARY'));assert.ok(rendered.includes('Official source QA'));assert.ok(rendered.includes('Facts reviewed by'));record(kind+' answers require review and display with sources and reviewer');
 }
 let d=await get(tour);
 for(const changes of [{canonical:'https://eviltangierexcursions.com/'},{openGraph:{...d.seo.openGraph,image:'javascript:alert(1)'}}]){const r=await request('seo-save',{...d.seo,...changes,confirmProtected:true},admin);assert.equal(r.status,400,JSON.stringify(r.data))}
 assert.equal((await request('presence-save',{path:tour,summary:'',questions:[],sources:[{label:'Unsafe',url:'javascript:alert(1)'}],reviewed:true,reviewer:'QA'},admin)).status,400);record('Unsafe social image URLs, source URLs and deceptive canonicals are rejected');
 let r=await request('seo-save',{...d.seo,status:'published',schemaMode:'custom',schema:[JSON.stringify({'@context':'https://schema.org','@type':'WebPage',name:'Saved schema QA'})],aeoQuestions:[{question:'Approved tour question QA',answer:'Approved factual answer QA',status:'published'},{question:'HIDDEN QUESTION QA',answer:'Unreviewed answer',status:'suggested'}]},admin);assert.equal(r.status,200,JSON.stringify(r.data));let rendered=await html(tour);assert.ok(rendered.includes('Saved schema QA'));assert.ok(rendered.includes('Approved tour question QA'));assert.ok(!rendered.includes('HIDDEN QUESTION QA'));record('Published custom schema and approved tour answers render; suggested answers stay private');
 const models=(await request('cms-tours',undefined,admin)).data;const model=models[tour];const media=model.media[1]||model.media[0];r=await request('cms-publish',{...model,featuredImage:media.url,media:model.media.map(m=>m.url===media.url?{...m,alt:'Tour featured QA alt'}:m)},admin);assert.equal(r.status,200,JSON.stringify(r.data));assert.equal((await request('cms-tours',undefined,admin)).data[tour].featuredImage,media.url);record('Tour featured image and descriptive text survive the existing atomic content save');
 await request('page-create',{path:'/hidden-visibility-draft/',name:'Hidden draft',kind:'page',reviewed:false},admin);const sitemap=await html('/pages-sitemap.xml');assert.ok(!sitemap.includes('/hidden-visibility-draft/'));assert.ok(sitemap.includes('/visibility-qa-page/'));record('Page sitemap includes published content and excludes unpublished drafts');
 console.log('Passed '+evidence.length+' visibility integration checks');
}finally{await mf.dispose()}
