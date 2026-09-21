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
 const form=new FormData();form.set('file',new File([Buffer.from('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+aZQAAAABJRU5ErkJggg==','base64')],'qa.png',{type:'image/png'}));const encodedUpload=new Request('http://test.local/api/upload',{method:'POST',body:form});const uploaded=await mf.dispatchFetch('http://test.local/api/upload',{method:'POST',headers:{'Content-Type':encodedUpload.headers.get('Content-Type'),Origin:'http://test.local','oai-authenticated-user-id':'test-admin','oai-authenticated-user-email':'admin@example.test'},body:await encodedUpload.arrayBuffer()});const uploadData=await uploaded.json();assert.equal(uploaded.status,200,JSON.stringify(uploadData));const fetched=await mf.dispatchFetch('http://test.local'+uploadData.url);assert.equal(fetched.status,200);assert.equal(fetched.headers.get('content-type'),'image/png');record('Authenticated image upload persists in object storage and serves with correct MIME type');

}finally{await mf.dispose()}
