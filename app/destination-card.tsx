'use client';
import {ArrowUpRight,MapPin} from 'lucide-react';
import {ResponsivePhoto} from './responsive-photo';
type DestinationCardProps={place:any;href:string;count?:number;expanded?:boolean;onClick?:()=>void};
export function DestinationCard({place,href,count=place.count,expanded=false,onClick}:DestinationCardProps){
 const location=[place.region,place.country].filter(Boolean).join(' · ');
 return <a className={'destination-postcard'+(expanded?' destination-postcard--expanded':'')} href={href} onClick={onClick} aria-label={'Explore '+place.name+(Number.isFinite(count)?' · '+count+' '+(count===1?'experience':'experiences'):'')}>
  <div className="destination-postcard-photo">{place.image?<ResponsivePhoto src={place.image} alt="" sizes="(max-width: 767px) 82vw, (max-width: 1024px) 44vw, 360px" loading="lazy"/>:<div className="destination-postcard-empty"><MapPin size={36} aria-hidden="true"/></div>}{location&&<span className="destination-postcard-location"><MapPin size={13} aria-hidden="true"/>{location}</span>}{place.badge&&<span className="destination-postcard-badge">{place.badge}</span>}</div>
  <div className="destination-postcard-body"><div className="destination-postcard-heading"><h3>{place.name}</h3><span className="destination-postcard-arrow" aria-hidden="true"><ArrowUpRight size={22}/></span></div>{expanded&&place.description&&<p className="destination-postcard-description">{place.description}</p>}<div className="destination-postcard-footer"><span>{Number.isFinite(count)?`${count} ${count===1?'experience':'experiences'}`:'Discover this destination'}</span><span>Explore <span aria-hidden="true">↗</span></span></div></div>
 </a>
}
