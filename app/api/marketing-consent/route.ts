import {setAnalyticsConsent} from '@/lib/marketing';
export async function POST(req:Request){if(req.headers.get('origin')!==new URL(req.url).origin)return new Response(null,{status:403});const b:any=await req.json();return Response.json(await setAnalyticsConsent(b.analytics===true),{headers:{'Cache-Control':'no-store'}});}
