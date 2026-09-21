import QRCode from 'qrcode';
import {tokenBooking,reviewOrigin} from '@/lib/review-engine';
export async function GET(req:Request,{params}:any){try{const {token}=await params;await tokenBooking(token);const svg=await QRCode.toString(reviewOrigin+'/review/'+token+'/',{type:'svg',width:180,margin:2,errorCorrectionLevel:'M'});return new Response(svg,{headers:{'Content-Type':'image/svg+xml','Cache-Control':'private,no-store','X-Robots-Tag':'noindex,nofollow','Referrer-Policy':'no-referrer'}})}catch{return new Response('Not found',{status:404})}}
