import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url);
const wranglerRequire=createRequire(require.resolve('wrangler/package.json'));
const {Miniflare}=wranglerRequire('miniflare');
const root=process.cwd();
const mf=new Miniflare({modules:[{type:'ESModule',path:path.join(root,'dist/server/index.js')},...fs.readdirSync('dist/server',{recursive:true}).filter(x=>x.endsWith('.js')&&x!=='index.js').map(x=>({type:'ESModule',path:path.join(root,'dist/server',x)}))],modulesRoot:path.join(root,'dist/server'),modulesRules:[{type:'ESModule',include:['**/*.js'],fallthrough:true}],compatibilityDate:'2026-05-15',compatibilityFlags:['nodejs_compat'],d1Databases:{DB:'test-database'},r2Buckets:{MEDIA:'test-media'},bindings:{ADMIN_USER_IDS:'test-admin'},assets:{directory:path.join(root,'dist/client'),binding:'ASSETS',routerConfig:{has_user_worker:true,invoke_user_worker_ahead_of_assets:true}},cf:false});
try{
 const database=await mf.getD1Database('DB');
 for(const filename of fs.readdirSync('drizzle').filter(x=>x.endsWith('.sql')).sort())for(const stmt of fs.readFileSync('drizzle/'+filename,'utf8').split('--> statement-breakpoint').map(x=>x.trim()).filter(Boolean))await database.prepare(stmt).run();
 const response=await mf.dispatchFetch('http://test.local/');assert.equal(response.status,200);
 const html=(await response.text()).replace(/<script\b[^>]*>[\s\S]*?<\/script>/gi,'');
 assert.ok(html.includes('tangier-excursions-hero-poster.jpg'));assert.ok(html.includes('One crossing.'));assert.ok(html.includes('Plan a custom tour'));assert.ok(!html.includes('<video'));assert.ok(!html.includes('cloudfront.net'));
 console.log('PASS: initial server HTML delivers poster and existing hero content without video downloads or external media URLs');
 for(const name of ['desktop.mp4','mobile.mp4','poster.jpg']){
  const asset='/assets/hero/tangier-excursions-hero-'+name;
  const response=await mf.dispatchFetch('http://test.local'+asset);assert.equal(response.status,200);
  assert.deepEqual(Buffer.from(await response.arrayBuffer()),fs.readFileSync('public'+asset));
 }
 console.log('PASS: all three approved files are served intact by project static storage');
}finally{await mf.dispose()}
