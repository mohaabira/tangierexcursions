import Site from '../site';
import {discoveryData} from '@/lib/discovery-server';
import {identity} from '@/lib/server';
export const dynamic='force-dynamic';
export const metadata={title:'Discover Morocco experiences | Tangier Excursions',robots:{index:false,follow:false}};
export default async function SearchPage({searchParams}:{searchParams:Promise<Record<string,string|string[]|undefined>>}){const p=await searchParams;const data=await discoveryData();const query=typeof p.q==='string'?p.q.slice(0,200):'';const selected=typeof p.filters==='string'?p.filters.split(',').filter(id=>data.terms.some(t=>t.id===id)):[];return <Site page={null} catalog={data.tours} path="/search/" logo="/assets/brand/primary.png" initialDiscovery={data} initialUser={await identity().catch(()=>null)} searchQuery={query} searchSelected={selected} searchOptions={{sort:typeof p.sort==='string'&&['price-asc','price-desc','name'].includes(p.sort)?p.sort:'recommended',max:typeof p.max==='string'&&Number(p.max)>0?p.max:'',experience:typeof p.experience==='string'&&['private','shared'].includes(p.experience)?p.experience:'all'}}/>}
