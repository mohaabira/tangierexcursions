import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'map-test-database'},r2Buckets:{MEDIA:'map-test-media'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
const evidence=[];
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 async function api(op,body){const r=await mf.dispatchFetch('http://test.local/api/'+op,{method:body===undefined?'GET':'POST',headers:{'Content-Type':'application/json',Origin:'http://test.local','oai-authenticated-user-id':'test-admin','oai-authenticated-user-email':'test-admin@example.test'},...(body===undefined?{}:{body:JSON.stringify(body)})});const d=await r.json();assert.equal(r.status,200,op+' '+JSON.stringify(d.error));return d}
 const tours=JSON.parse(fs.readFileSync('data/catalog.json','utf8')).filter(p=>p.kind==='tour');
 const coordinates=g=>(g.routePoints?.length?g.routePoints:g.itinerary).filter(s=>Number.isFinite(s.lat)&&Number.isFinite(s.lng)).map(s=>({id:s.id,location:s.location,lat:s.lat,lng:s.lng,mapOrder:s.mapOrder}));
 for(const p of tours){
   const g=(await api('golden-admin?path='+encodeURIComponent(p.path))).tour;
   assert.equal(g.map.enabled,true,p.path);assert.ok(coordinates(g).length,p.path);
   let response=await mf.dispatchFetch('http://test.local'+p.path);assert.equal(response.status,200);let html=await response.text();
   assert.ok(html.includes('id="map"'),p.path+' map');assert.ok(html.includes('Explore route map'),p.path+' deferred map');assert.ok(!html.includes('src="https://tile.openstreetmap.org'),p.path+' deferred tiles');assert.ok(html.includes(p.canonical[0]),p.path+' canonical');
   await api('golden-save',{action:'save',tour:g});const refreshed=(await api('golden-admin?path='+encodeURIComponent(p.path))).tour;assert.deepEqual(coordinates(refreshed),coordinates(g));
   evidence.push({path:p.path,map:true,deferred:true,adminPersistence:true,canonical:true});
 }
 const home=await(await mf.dispatchFetch('http://test.local/')).text();
 assert.ok(home.indexOf('id="destinations"')>=0);assert.ok(home.indexOf('id="destinations"')<home.indexOf('Across the Strait. Beyond the ordinary.'));assert.ok(home.indexOf('Across the Strait. Beyond the ordinary.')<home.indexOf('category-discovery'));
 const discovery=await api('discovery');assert.ok(new Set(discovery.terms.filter(t=>t.kind==='type').map(t=>t.icon)).size>=4);
 const g=(await api('golden-admin?path='+encodeURIComponent(tours[0].path))).tour;const original=g.routePoints[0].location;g.routePoints[0].location='QA saved location';await api('golden-save',{action:'save',tour:g});assert.equal((await api('golden-admin?path='+encodeURIComponent(g.path))).tour.routePoints[0].location,'QA saved location');const html=await(await mf.dispatchFetch('http://test.local'+g.path)).text();assert.ok(html.includes('QA saved location'));g.routePoints[0].location=original;await api('golden-save',{action:'save',tour:g});
 fs.writeFileSync('migration/MAP-HOME-PERFORMANCE-QA.json',JSON.stringify({tours:evidence.length,checks:evidence,homepageOrder:true,distinctCategoryIcons:true,mapEditUpdatesFrontend:true,browserVisualQA:'Not verified in this run',coreWebVitals:'Not measured'},null,2));console.log('PASS',evidence.length,'tour maps, persistence, canonicals, deferred tiles, homepage order and category icons');
}finally{await mf.dispose()}
