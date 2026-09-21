import {env} from 'cloudflare:workers';
import {headers} from 'next/headers';
export const dynamic='force-dynamic';
export default async function robots(){const h=await headers(),live=(env as any).SEO_PUBLIC_INDEXING==='true'&&/^(www\.)?tangierexcursions\.com$/.test((h.get('host')||'').split(':')[0]);return live?{rules:{userAgent:'*',allow:'/',disallow:['/admin/','/api/','/account/','/auth/','/booking-link/','/passengers/','/partners/portal/']},sitemap:'https://www.tangierexcursions.com/sitemap.xml'}:{rules:{userAgent:'*',disallow:'/'}}}
