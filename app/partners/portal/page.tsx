import {identity} from '@/lib/server';
import {PartnerWorkspace} from '@/app/partner-workspace';
import {CustomerLogin} from '@/app/customer-login';
export const dynamic='force-dynamic';
export const metadata={title:'Partner workspace | Tangier Excursions',robots:{index:false,follow:false}};
export default async function Page(){const user=await identity();return user?<PartnerWorkspace user={user}/>:<CustomerLogin returnTo="/partners/portal/"/>}
