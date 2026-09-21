import {NextResponse} from 'next/server';
import {cookies} from 'next/headers';
import {requireAuthConfig,providerRequest,establishSession,FLOW,cookieOptions} from '@/lib/customer-auth';
import {safeReturn} from '@/lib/customer-auth-core';
export const dynamic='force-dynamic';
export async function GET(req:Request){
 const url=new URL(req.url);const jar=await cookies();
 try{
  const c=await requireAuthConfig(req);const raw=jar.get(FLOW)?.value;
  jar.set(FLOW,'',{...cookieOptions,maxAge:0});
  if(!raw||url.searchParams.has('error'))throw Error('Cancelled');
  const flow=JSON.parse(raw),code=url.searchParams.get('code');
  if(!code||code.length>2000||flow.expires<Date.now()||url.searchParams.get('flow')!==flow.flow)throw Error('Expired');
  const result=await providerRequest(c,'token?grant_type=pkce',{auth_code:code,code_verifier:flow.verifier});
  await establishSession(c,result);
  const response=NextResponse.redirect(new URL(safeReturn(flow.next),url.origin));response.headers.set('Cache-Control','no-store');response.headers.set('Referrer-Policy','no-referrer');return response;
 }catch{const response=NextResponse.redirect(new URL('/login/?error=signin',url.origin));response.headers.set('Cache-Control','no-store');response.headers.set('Referrer-Policy','no-referrer');return response}
}
