import {NextResponse} from 'next/server';
import {cookies} from 'next/headers';
import {authStatus,requireAuthConfig,providerRequest,throttle,establishSession,customerLogout,randomToken,FLOW,cookieOptions} from '@/lib/customer-auth';
import {validEmail,safeReturn,sameOrigin} from '@/lib/customer-auth-core';
export const dynamic='force-dynamic';
const headers={'Cache-Control':'no-store','Referrer-Policy':'no-referrer'};
export async function GET(_req:Request,{params}:any){const {action}=await params;if(action!=='status')return NextResponse.json({error:'Not found'},{status:404,headers});try{return NextResponse.json(await authStatus(),{headers})}catch{return NextResponse.json({error:'Sign-in is temporarily unavailable.'},{status:503,headers})}}
export async function POST(req:Request,{params}:any){
 try{
  if(!sameOrigin(req))return NextResponse.json({error:'Please reload this page and try again.'},{status:403,headers});
  if(Number(req.headers.get('content-length'))>4096)throw Error('Request too large.');
  const text=await req.text();if(text.length>4096)throw Error('Request too large.');const b=JSON.parse(text);const {action}=await params;
  if(action==='logout'){await customerLogout(b.all===true);return NextResponse.json({ok:true},{headers})}
  const c=await requireAuthConfig(req);const ip=req.headers.get('cf-connecting-ip')||'unknown';
  await throttle('ip:'+ip,40,600);
  if(action==='oauth'){
   const provider=b.provider;if(!['google','facebook'].includes(provider)||!c.settings[provider].planned)throw Error('This sign-in method is unavailable.');
   const verifier=randomToken(),flow=randomToken();const bytes=new Uint8Array(await crypto.subtle.digest('SHA-256',new TextEncoder().encode(verifier)));const challenge=btoa(String.fromCharCode(...bytes)).replace(/\+/g,'-').replace(/\//g,'_').replace(/=+$/,'');
   (await cookies()).set(FLOW,JSON.stringify({verifier,flow,next:safeReturn(b.next),expires:Date.now()+600000}),{...cookieOptions,maxAge:600});
   const redirect=c.settings.liveOrigin+'/auth/customer/callback/?flow='+flow;
   const url=new URL(c.url+'/auth/v1/authorize');url.search=new URLSearchParams({provider,redirect_to:redirect,code_challenge:challenge,code_challenge_method:'s256',scopes:provider==='facebook'?'email':'openid email profile'}).toString();
   return NextResponse.json({url:url.href},{headers});
  }
  if(!c.settings.email.planned)throw Error('Email sign-in is unavailable.');
  const email=validEmail(b.email);
  if(action==='send'){
   await throttle('send:'+email,1,60);await throttle('send-day:'+email,15,86400);
   await providerRequest(c,'otp',{email,create_user:true});
   return NextResponse.json({ok:true,message:'Check your inbox for your verification code.'},{headers});
  }
  if(action==='verify'){
   await throttle('verify:'+email,8,600);
   if(typeof b.code!=='string'||!/^\d{6,8}$/.test(b.code))throw Error('Enter the code from your email.');
   const result=await providerRequest(c,'verify',{email,token:b.code,type:'email'});await establishSession(c,result);
   return NextResponse.json({ok:true,next:safeReturn(b.next)},{headers});
  }
  return NextResponse.json({error:'Not found'},{status:404,headers});
 }catch(e:any){return NextResponse.json({error:e instanceof SyntaxError?'Please check your details and try again.':e.message||'Sign-in is temporarily unavailable.'},{status:400,headers})}
}
