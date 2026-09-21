import {requireUser,db,editablePages,now} from '@/lib/server';
import {canMarketing} from '@/lib/admin-permissions';
import {organicDashboard,inspectPage,startAudit,auditBatch,issueAction,mediaAudit} from '@/lib/organic-audit';
import {saveKnowledge,knowledgeList,saveReview,saveOrganicRelationship,organicSave,organicSetting} from '@/lib/organic-content';
import {parseMigration,validateRedirects} from '@/lib/organic-core';
const headers={'Cache-Control':'no-store','X-Robots-Tag':'noindex, nofollow'};
async function permit(content=false){const u=await requireUser();if(!canMarketing(u.role,content?'manage_landing_pages':'manage_seo'))throw Error('SEO permission required');return u}
export async function GET(req:Request){try{const q=new URL(req.url).searchParams,mode=q.get('mode');await permit(mode==='knowledge'||mode==='inspect');const data=mode==='knowledge'?await knowledgeList():mode==='inspect'?await inspectPage(q.get('path')||''):mode==='media'?await mediaAudit():await organicDashboard();return Response.json(data,{headers})}catch(e:any){return Response.json({error:e.message},{status:403,headers})}}
export async function POST(req:Request){try{if(req.headers.get('origin')!==new URL(req.url).origin)return new Response(null,{status:403});if(Number(req.headers.get('content-length'))>500000)throw Error('Request too large');const b:any=await req.json(),u=await permit(b.action==='knowledge'),v=b.value||{};let result:any;
if(b.action==='knowledge')result=await saveKnowledge(v,u.id);
else if(b.action==='review')result=await saveReview(v);
else if(b.action==='relationship')result=await saveOrganicRelationship(v);
else if(b.action==='audit-start')result=await startAudit(u.id);
else if(b.action==='audit-batch')result=await auditBatch(v.id);
else if(b.action==='issues')result=await issueAction(v.ids||[],v.status);
else if(b.action==='migration-import')result=await organicSave('seo:migration-review',parseMigration(String(v.csv||'')));
else if(b.action==='migration-apply'){if(v.reviewed!==true)throw Error('Review the selected mapping first');const imported=await organicSetting('seo:migration-review',[]),chosen=imported[Number(v.index)];if(!chosen)throw Error('Select a mapping');if(['301 redirect','410 retire'].includes(chosen.action)){const rules=await organicSetting('seo:redirects',[]);rules.push({id:crypto.randomUUID(),source:chosen.source,destination:chosen.destination,type:chosen.action==='410 retire'?410:301,reason:chosen.notes,created:now(),hits:0});validateRedirects(rules,new Set((await editablePages()).filter(p=>!p.draft).map(p=>p.path)));await organicSave('seo:redirects',rules)}else if(chosen.action==='review')throw Error('Choose a final action before applying');chosen.applied=now();result=await organicSave('seo:migration-review',imported)}
else if(b.action==='404-ignore'){await db().prepare("UPDATE records SET data=json_set(data,'$.status','ignored') WHERE id=? AND kind='seo-404'").bind(v.id).run();result={ok:true}}
else if(b.action==='intervals'){const config:any={};for(const [key,days] of Object.entries(v)){if(!Number.isInteger(days)||Number(days)<7||Number(days)>730)throw Error('Intervals must be 7–730 days');config[key.slice(0,80)]=days}result=await organicSave('seo:review-intervals',config)}
else throw Error('Unknown SEO action');return Response.json(result,{headers})}catch(e:any){return Response.json({error:e.message},{status:400,headers})}}
