export type HomeSection={id:string;kind:string;enabled:boolean;title:string;kicker:string;url:string;source:string;term:string;paths:string[];limit:number};
const s=(id:string,kind:string,title='',kicker='',url='',source='all',term=''):HomeSection=>({id,kind,enabled:true,title,kicker,url,source,term,paths:[],limit:24});
export const homeSections:HomeSection[]=[s('places','destinations'),s('day-trips','tours','Across the Strait. Beyond the ordinary.','PRIVATE DAY TRIPS FROM SPAIN','/tangier-day-trips/','spain-day'),s('categories','categories'),s('journey','journey'),s('short-trips','tours','Stay a little longer. Discover a lot more.','SHORT MOROCCO ESCAPES','/best-tangier-tours/','type','type-short-morocco-trips'),s('multi-day','tours','The Morocco you’ve been dreaming of.','COMPLETE PRIVATE MOROCCO TOURS','/morocco-vacation-packages/','type','type-multi-day-morocco-tours'),s('custom','custom'),s('reviews','reviews'),s('gift','gift')];
const legacyTerms:Record<string,string>={'Private Day Trips':'type-private-day-trips','Short Morocco Trips':'type-short-morocco-trips','Multi-Day Morocco Tours':'type-multi-day-morocco-tours'};
export function normalizeHomeLayout(value:any){const saved=Array.isArray(value?.sections)?value.sections:[];const ordered=[...new Set([...saved.map((x:any)=>x.id),...homeSections.map(x=>x.id)])];return {sections:ordered.flatMap(id=>{const base=homeSections.find(x=>x.id===id);if(!base)return [];const current=saved.find((x:any)=>x.id===id)||{};return [{...base,...current,kind:base.kind,enabled:current.enabled!==false,paths:Array.isArray(current.paths)?current.paths:base.paths,term:legacyTerms[current.term||base.term]||current.term||base.term}]})}}
export function sectionTours(section:HomeSection,data:any){
 const terms=data?.terms||[],id=legacyTerms[section.term]||section.term;
 const has=(t:any,kind:string,key:string)=>terms.some((x:any)=>x.kind===kind&&(x.id===key||x.name===key)&&t.terms?.includes(x.id));
 const rows=(data?.tours||[]).filter((t:any)=>!t.draft);
 const matches=rows.filter((t:any)=>section.source==='selected'?section.paths.includes(t.path):section.source==='featured'?t.featured:section.source==='spain-day'?has(t,'type','type-private-day-trips')&&terms.some((x:any)=>x.kind==='origin'&&x.country==='Spain'&&t.terms?.includes(x.id)):['type','destination','origin','activity'].includes(section.source)?has(t,section.source,id):true);
 // Only the original curated collections have an audited recovery source. Never
 // replace a custom selection/filter with unrelated products or revive drafts.
 const original=homeSections.find(x=>x.id===section.id);
 const recover=!matches.length&&original&&section.source===original.source&&id===original.term;
 return (recover?rows.filter((t:any)=>data?.homepage?.recovery?.[section.id]?.includes(t.path)):matches).slice(0,section.limit||24);
}
