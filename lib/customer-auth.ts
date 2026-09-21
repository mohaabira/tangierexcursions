import {env} from 'cloudflare:workers';
import {cookies} from 'next/headers';
import {loginDefaults} from './login-settings-schema';
import {verifiedCustomer} from './customer-auth-core';
export const SESSION='__Host-te_customer';
export const FLOW='__Host-te_oauth';
const db=()=>{if(!env.DB)throw Error('Sign-in is temporarily unavailable.');return env.DB};
export const cookieOptions={httpOnly:true,secure:true,sameSite:'lax' as const,path:'/'};
export const randomToken=()=>Array.from(crypto.getRandomValues(new Uint8Array(32)),x=>x.toString(16).padStart(2,'0')).join('');
export async function hash(value:string){return Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',new TextEncoder().encode(value))),x=>x.toString(16).padStart(2,'0')).join('')}
export async function authConfiguration(){
  const r=await db().prepare("SELECT value FROM settings WHERE key='customer-login-setup'").first<{value:string}>();
  const saved=r?JSON.parse(r.value):{};const settings={...loginDefaults,...saved,service:{...loginDefaults.service,...saved.service}};
  const runtime=env as any;const enabled=runtime.CUSTOMER_AUTH_ENABLED==='true';
  const url=settings.service.url;const key=settings.service.publishableKey;
  const configured=!!(url&&key&&settings.liveOrigin);
  return {settings,url,key,enabled,configured};
}
export async function providerRequest(c:any,path:string,body?:any,access?:string){
  const response=await fetch(c.url+'/auth/v1/'+path,{method:body===undefined?'GET':'POST',headers:{apikey:c.key,'Content-Type':'application/json',...(access?{Authorization:'Bearer '+access}:{})},...(body===undefined?{}:{body:JSON.stringify(body)}),signal:AbortSignal.timeout(12000),redirect:'manual'});
  const data:any=await response.json();
  if(!response.ok)throw Error(response.status===429?'Too many attempts. Please wait a few minutes.':path==='verify'?'That code is invalid or expired. Request a new code and try again.':'Sign-in is temporarily unavailable. Please try again.');
  return data;
}
export async function authStatus(){
  const c=await authConfiguration();let remote:any=null;
  if(c.configured)try{remote=await providerRequest(c,'settings')}catch{}
  return {enabled:c.enabled,configured:c.configured,reachable:!!remote,google:!!(c.enabled&&remote?.external?.google&&c.settings.google.planned),facebook:!!(c.enabled&&remote?.external?.facebook&&c.settings.facebook.planned),email:!!(c.enabled&&remote?.external?.email&&c.settings.email.planned),callback:c.settings.liveOrigin?c.settings.liveOrigin+'/auth/customer/callback/':'',providerCallback:c.url?c.url+'/auth/v1/callback':'',preview:!c.enabled};
}
export async function requireAuthConfig(request:Request){
  const c=await authConfiguration();
  if(!c.enabled||!c.configured)throw Error('Customer sign-in will be available when our new website launches.');
  if(new URL(request.url).origin!==c.settings.liveOrigin)throw Error('Please sign in on our main website.');
  return c;
}
export async function throttle(key:string,limit:number,seconds:number){
  const id=await hash(key);const now=Date.now();
  const row=await db().prepare('INSERT INTO customer_auth_limits (id,attempts,expires) VALUES (?,1,?) ON CONFLICT(id) DO UPDATE SET attempts=CASE WHEN expires<? THEN 1 ELSE attempts+1 END, expires=CASE WHEN expires<? THEN excluded.expires ELSE expires END RETURNING attempts').bind(id,now+seconds*1000,now,now).first<{attempts:number}>();
  if(!row||row.attempts>limit)throw Error('Too many attempts. Please wait a few minutes before trying again.');
}
export async function establishSession(c:any,result:any){
  // Never trust callback parameters or an unverified JWT payload for identity.
  if(!result.access_token)throw Error('We could not verify this sign-in. Please try again.');
  const user=verifiedCustomer(await providerRequest(c,'user',undefined,result.access_token));
  const jar=await cookies();const previous=jar.get(SESSION)?.value;
  if(previous)await db().prepare('DELETE FROM customer_auth_sessions WHERE token_hash=?').bind(await hash(previous)).run();
  const token=randomToken();const expires=Date.now()+7*86400000;
  await db().batch([
    db().prepare('DELETE FROM customer_auth_sessions WHERE expires<?').bind(Date.now()),
    db().prepare('DELETE FROM customer_auth_limits WHERE expires<?').bind(Date.now()),
    db().prepare('INSERT INTO customer_auth_sessions (token_hash,owner,email,name,expires) VALUES (?,?,?,?,?)').bind(await hash(token),user.id,user.email,user.name,expires)
  ]);
  jar.set(SESSION,token,{...cookieOptions,maxAge:7*86400});return user;
}
export async function customerIdentity(){
  if((env as any).CUSTOMER_AUTH_ENABLED!=='true')return null;
  const token=(await cookies()).get(SESSION)?.value;if(!token)return null;
  const row=await db().prepare('SELECT owner,email,name FROM customer_auth_sessions WHERE token_hash=? AND expires>?').bind(await hash(token),Date.now()).first<any>();
  return row?{id:row.owner,email:row.email,name:row.name,role:'customer'}:null;
}
export async function customerLogout(all=false){
  const jar=await cookies(),token=jar.get(SESSION)?.value;
  if(token){const digest=await hash(token);if(all){const row=await db().prepare('SELECT owner FROM customer_auth_sessions WHERE token_hash=? AND expires>?').bind(digest,Date.now()).first<any>();if(row)await db().prepare('DELETE FROM customer_auth_sessions WHERE owner=?').bind(row.owner).run()}else await db().prepare('DELETE FROM customer_auth_sessions WHERE token_hash=?').bind(digest).run()}
  jar.set(SESSION,'',{...cookieOptions,maxAge:0});jar.set(FLOW,'',{...cookieOptions,maxAge:0});
}
