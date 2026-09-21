import {companyDetails} from '@/lib/company';
import {identity,editablePages} from '@/lib/server';
import {aboutDocument} from '@/lib/about-cms';
import {publishedReviews} from '@/lib/review-engine';
import {discoveryData} from '@/lib/discovery-server';
import {clientSummary} from '@/lib/client-summary';
import {logo} from '@/lib/model';
import {notFound} from 'next/navigation';
import Site from '@/app/site';
export const dynamic='force-dynamic';
export default async function AboutPreview(){const user=await identity();if(user?.role!=='admin')notFound();const all=await editablePages(),source=all.find(p=>p.path==='/about-us/');const page={...source,content:'',aboutDocument:await aboutDocument(true),aboutCompany:await companyDetails(),aboutReviews:await publishedReviews()};return <><div className="about-draft-banner">About Us draft preview · only administrators can see this version · <a href="/admin/?section=about-us">Return to editor</a></div><Site initialDiscovery={await discoveryData()} page={page} path="/about-us/" catalog={all.filter(p=>!p.draft).map((p:any)=>clientSummary(p))} initialUser={user} logo={logo}/></>}
