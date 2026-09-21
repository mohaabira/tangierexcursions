import {identity,editablePages} from '@/lib/server';
import {CustomerLogin} from '@/app/customer-login';
import {BookingWorkspace} from '@/app/booking-workspace';
export const dynamic='force-dynamic';
export const metadata={title:'Booking workspace | Tangier Excursions',robots:{index:false,follow:false}};
export default async function Page(){const user=await identity();if(!user)return <CustomerLogin returnTo="/booking-workspace/"/>;const catalog=(await editablePages()).filter(p=>p.kind==='tour'&&!p.draft).map(p=>({path:p.path,name:p.name,kind:p.kind}));return <main className="section"><a href="/account/">← My account</a><h1>Booking workspace</h1><BookingWorkspace catalog={catalog} user={user}/></main>}
