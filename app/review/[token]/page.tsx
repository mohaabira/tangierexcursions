import {publicReviewContext} from '@/lib/review-engine';
import {ReviewJourney} from '@/app/reputation';
export const dynamic='force-dynamic';
export const metadata={title:'Share your journey | Tangier Excursions',robots:{index:false,follow:false},referrer:'no-referrer'};
export default async function ReviewPage({params}:any){const {token}=await params;try{return <ReviewJourney context={await publicReviewContext(token)}/>}catch{return <main className="review-journey"><img className="review-brand" src="/assets/brand/primary.png" alt="Tangier Excursions"/><div className="review-journey-card"><h1>This review link is unavailable.</h1><p>It may have expired or the booking is no longer eligible. You can find your completed trips in your account.</p><a className="primary" href="/account/">My account</a></div></main>}}
