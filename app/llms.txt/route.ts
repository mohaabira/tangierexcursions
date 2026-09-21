import {llmsText} from '@/lib/seo-platform';
export async function GET(){const text=await llmsText();return text?new Response(text,{headers:{'Content-Type':'text/plain; charset=utf-8','Cache-Control':'public, max-age=300','X-Robots-Tag':'noindex'}}):new Response('Not found',{status:404})}
