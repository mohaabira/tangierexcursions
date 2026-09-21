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
 const admin='test-admin',tour='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/';

 const mediaBefore=await request('editor-media',undefined,admin);assert.equal(mediaBefore.status,200);assert.ok(mediaBefore.data.length);
 assert.equal((await request('page-document?path=/about-us/',undefined,null)).status,403);record('Editorial source and media require staff access');
 const body='<h2>Explore Tangier</h2><p>A <strong>private journey</strong> with <span style="font-weight: 600">local insight</span> and <a href="/tangier-day-trips/" target="_blank">day trips</a>.</p><img src="/media/editor-qa" alt="Tangier coast"><script>alert(1)</script><a href="javascript:alert(1)" onclick="alert(2)">bad link</a>';
 for(const kind of ['page','article']){
  const path='/visual-editor-qa-'+kind+'/';
  let r=await request('page-create',{path,name:'Visual editor QA '+kind,kind,reviewed:true,intro:'',editorial:{html:body}},admin);assert.equal(r.status,200,JSON.stringify(r.data));
  const doc=(await request('page-document?path='+encodeURIComponent(path),undefined,admin)).data;
  assert.ok(doc.editorial.html.includes('font-weight:600'));assert.ok(doc.editorial.html.includes('<strong>'));assert.ok(doc.editorial.html.includes('href="/tangier-day-trips/"'));assert.ok(doc.editorial.html.includes('alt="Tangier coast"'));assert.ok(!doc.editorial.html.includes('javascript:'));assert.ok(!doc.editorial.html.includes('<script'));assert.ok(!doc.editorial.html.includes('onclick'));
  const html=await (await mf.dispatchFetch('http://test.local'+path)).text();assert.ok(html.includes('Explore Tangier'));assert.ok(html.includes('font-weight:600'));record(kind+' visual formatting, links and image alt text persist and render; unsafe markup removed');
  const {created,...withoutCreated}=doc;r=await request('page-edit',{...withoutCreated,editorial:{...doc.editorial,html:'<p>Updated body</p>'}},admin);assert.equal(r.status,200);
  assert.equal((await request('page-document?path='+encodeURIComponent(path),undefined,admin)).data.created,true);assert.ok((await (await mf.dispatchFetch('http://test.local'+path)).text()).includes('Updated body'));record(kind+' remains present after subsequent saves');
 }
 const model=(await request('cms-tours',undefined,admin)).data[tour];const pricing=(await request('tour?path='+encodeURIComponent(tour),undefined,null)).data;const home=await (await mf.dispatchFetch('http://test.local/')).text();
 const rich={...model,golden:{...model.golden,overview:[{text:'Rich tour paragraph',html:'<strong>Rich tour paragraph</strong> <span style="font-weight: 500">medium</span> <a href="https://example.com">anchor text</a><img src="/media/editor-qa" alt="Tour photo">',links:[]}]}};
 let r=await request('cms-publish',rich,admin);assert.equal(r.status,200,JSON.stringify(r.data));assert.ok(r.data.golden.overview[0].html.includes('font-weight:500'));const rendered=await (await mf.dispatchFetch('http://test.local'+tour)).text();assert.ok(rendered.includes('<strong>Rich tour paragraph</strong>'));assert.ok(rendered.includes('href="https://example.com"'));record('Tour visual text survives atomic save and renders on its existing route');
 assert.deepEqual((await request('tour?path='+encodeURIComponent(tour),undefined,null)).data,pricing);const homeAfter=await (await mf.dispatchFetch('http://test.local/')).text();assert.deepEqual([...homeAfter.matchAll(/data-home-section="([^"]+)"/g)].map(m=>m[1]),[...home.matchAll(/data-home-section="([^"]+)"/g)].map(m=>m[1]));record('Rich tour editing preserves homepage sections and authoritative pricing');
 const image=new File([Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aXioAAAAASUVORK5CYII=','base64')],'editor.png',{type:'image/png'});const form=new FormData();form.set('file',image);const serialized=new Request('http://test.local/api/upload',{method:'POST',body:form});const uploaded=await mf.dispatchFetch('http://test.local/api/upload',{method:'POST',headers:{Origin:'http://test.local','Content-Type':serialized.headers.get('content-type'),'oai-authenticated-user-id':admin,'oai-authenticated-user-email':admin+'@example.test'},body:await serialized.arrayBuffer()});const asset=await uploaded.json();assert.equal(uploaded.status,200,JSON.stringify(asset));assert.ok(asset.url.startsWith('/media/'));assert.ok((await request('editor-media',undefined,admin)).data.some(m=>m.url===asset.url));record('Image upload appears in the visual editor media library');
 console.log('Passed '+evidence.length+' visual content integration checks');
}finally{await mf.dispose()}
