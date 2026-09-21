import type { NextConfig } from 'next';
const nextConfig:NextConfig={trailingSlash:true,async headers(){return [{source:'/review/:path*',headers:[{key:'Cache-Control',value:'private, no-store'},{key:'X-Robots-Tag',value:'noindex, nofollow'},{key:'Referrer-Policy',value:'no-referrer'}]}]}};
export default nextConfig;
