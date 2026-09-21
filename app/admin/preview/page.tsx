import {editorState} from '@/lib/admin-content';
import {saveTour} from '@/lib/tour-cms';
import {saveGolden} from '@/lib/golden-server';
import {canAdminOperation} from '@/lib/admin-permissions';
import {clientSummary} from '@/lib/client-summary';
import {identity,editablePages,tourConfig} from '@/lib/server';
import {notFound} from 'next/navigation';
import Site from '@/app/site';
import {logo} from '@/lib/model';
export const dynamic='force-dynamic';
export default async function Preview({searchParams}:{searchParams:Promise<{tour?:string;draft?:string}>}){const user=await identity();if(!user||!canAdminOperation(user.role,'cms-tours'))notFound();const {tour,draft}=await searchParams;const all=await editablePages();let p=all.find(p=>p.path===tour);if(draft==='1'&&tour){const state=await editorState('tour:'+tour,user.id);if(state.draft){const product:any=await saveTour(state.draft.value,undefined,true);product.golden=await saveGolden({action:'save',tour:state.draft.value.golden},user.id,true);p={...(p||{path:tour,kind:'tour',title:product.name,meta:{},canonical:[],structured_data:[],content:'',images:[],internal_links:[]}),name:product.name,product,featuredImage:product.featuredImage,gallery:product.media.map((m:any)=>m.url),pricing:p?.pricing||[],draft:true}}}if(!p)notFound();const page={...p,organized:p.product?.sections,pricing:all.some(x=>x.path===p.path)?(await tourConfig(p.path)).tiers:[]};const catalog=all.filter(p=>!p.draft).map((p:any)=>clientSummary(p));return <Site page={page} path={p.path} catalog={catalog} initialUser={user} logo={logo}/>}
