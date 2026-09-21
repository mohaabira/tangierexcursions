import images from '@/data/responsive-images.json';
export function ResponsivePhoto({src,sizes='(max-width: 767px) 80vw, 300px',...props}:any){const image=(images as any)[src];return <img decoding="async" width={image?.width} height={image?.height} src={src} srcSet={image?.srcSet} sizes={image?sizes:undefined} {...props}/>}
