import {identity,editablePages} from '@/lib/server';
import {bookingLinkInfo} from '@/lib/booking-service';
import {BookingLinkClient} from '@/app/booking-link-client';
import {CustomerLogin} from '@/app/customer-login';
import {notFound} from 'next/navigation';
export const dynamic='force-dynamic';
export const metadata={title:'Secure booking | Tangier Excursions',robots:{index:false,follow:false},referrer:'no-referrer'};
export default async function Page({params}:any){const {token}=await params;const user=await identity();if(!user)return <CustomerLogin returnTo={'/booking-link/'+token+'/'}/>;let info;try{info=await bookingLinkInfo(token,user)}catch{notFound()}const title=(await editablePages()).find(p=>p.path===info.tour)?.name||'Your journey';return <BookingLinkClient info={info} token={token} title={title}/>}
