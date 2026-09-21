'use client';
import {Compass,Images,FileText,Wallet,Settings,Search,ChevronRight} from 'lucide-react';
const groups=[
 {name:'The experience',icon:Compass,items:['Basic','Discovery','Media']},
 {name:'Story & itinerary',icon:FileText,items:['Content','Highlights','Itinerary','Journey','Inclusions','Before You Go','FAQs','Location & Map']},
 {name:'Booking & pricing',icon:Wallet,items:['Pricing','Availability','Pickup','Booking']},
 {name:'Reach & recommendations',icon:Search,items:['SEO','Translations','Reviews','Related']},
];
const labels:Record<string,string>={Basic:'Overview',Content:'Description',Media:'Photo gallery',Inclusions:'Included & excluded',Discovery:'Categories & destinations',Journey:'Journey steps',Booking:'Booking settings',SEO:'Search visibility',Related:'Related experiences',Translations:'Translations'};
const legacy=['Basic','Discovery','Media','Content','Journey','Pricing','Availability','Pickup','Booking','SEO','Reviews','Related'];
export function TourEditorNavigation({golden,value,onChange}:{golden:boolean;value:string;onChange:(v:string)=>void}){
 const visible=groups.map(g=>({...g,items:g.items.filter(i=>golden?i!=='Journey':legacy.includes(i))}));
 return <><label className="tour-section-select field"><span>Editing section</span><select value={value} onChange={e=>onChange(e.target.value)}>{visible.map(g=><optgroup key={g.name} label={g.name}>{g.items.map(i=><option key={i} value={i}>{labels[i]||i}</option>)}</optgroup>)}</select></label><nav className="tour-section-nav" aria-label="Tour editing sections"><p className="admin-kicker">EDIT YOUR EXPERIENCE</p>{visible.map(({name,icon:Icon,items})=><div className="tour-section-group" key={name}><h3><Icon size={15}/>{name}</h3>{items.map(i=><button type="button" key={i} aria-current={value===i?'step':undefined} aria-controls="tour-editor-panel" onClick={()=>onChange(i)}>{labels[i]||i}{value===i&&<ChevronRight size={15}/>}</button>)}</div>)}<p className="tour-editor-tip"><Images size={17}/>Select text in the editor to format it or add a link. Use Photo gallery for tour images.</p></nav></>;
}
