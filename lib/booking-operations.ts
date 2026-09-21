import {env} from 'cloudflare:workers';
import {db,now,requireUser,requireStaffFor,queueEmail,record} from './server';
import {tourModels} from './tour-cms';

const text=(v:any,n=200)=>String(v??'').trim().slice(0,n);
export function validateOperations(v:any={}){
 const suppliers=(v.suppliers||[]).map((s:any)=>({id:text(s.id,80),name:text(s.name),email:text(s.email),role:text(s.role,30),enabled:s.enabled!==false}));
 if(suppliers.length>20||new Set(suppliers.map((s:any)=>s.id)).size!==suppliers.length||suppliers.some((s:any)=>!s.id||!s.name||!/^\S+@\S+\.\S+$/.test(s.email)||!['guide','driver','transport','ferry','hotel','activity'].includes(s.role)))throw Error('Provide a unique supplier, valid email and role.');
 return {ferryIncluded:v.ferryIncluded===true,passportRequired:v.ferryIncluded===true,suppliers};
}
async function booking(id:string){const u=await requireUser();const b=await db().prepare('SELECT * FROM bookings WHERE id=?').bind(id).first<any>();if(!b||(u.role!=='admin'&&(b.owner!==u.id||JSON.parse(b.data).partnerId)))throw Error('Booking access required');return {u,b};}
async function key(){const secret=(env as any).PASSPORT_ENCRYPTION_KEY;if(!secret||!/^[a-f0-9]{64}$/.test(secret))throw Error('Secure passenger storage is not configured. Please contact the team.');return crypto.subtle.importKey('raw',Uint8Array.from(secret.match(/../g).map((h:string)=>parseInt(h,16))),{name:'AES-GCM'},false,['encrypt','decrypt']);}
const encode=(v:Uint8Array)=>btoa(String.fromCharCode(...v));
const decode=(v:string)=>Uint8Array.from(atob(v),c=>c.charCodeAt(0));
export async function passengerDetails(id:string){const {u,b}=await booking(id);const r=await db().prepare("SELECT data FROM records WHERE id=? AND kind='passengers'").bind('passengers:'+id).first<any>();const state=r?JSON.parse(r.data):null;let passengers:any[]=[];
 if(state?.sealed&&!state.reviewRequired&&b.status!=='cancelled'){const raw=await crypto.subtle.decrypt({name:'AES-GCM',iv:decode(state.iv),additionalData:new TextEncoder().encode(id)},await key(),decode(state.sealed));passengers=JSON.parse(new TextDecoder().decode(raw));if(u.role==='admin')await record('admin-log',u.id,{action:'Passenger details accessed',target:id});}
 return {booking:id,guests:b.guests,date:b.date,required:!!state,status:state?.status||'Not required',passengers,canEdit:b.status==='test-confirmed'&&!!state};
}
export async function savePassengers(input:any){const {b,u}=await booking(input.booking);const r=await db().prepare("SELECT data FROM records WHERE id=? AND kind='passengers'").bind('passengers:'+b.id).first<any>();if(!r||b.status!=='test-confirmed')throw Error('Passenger details are not requested for this booking.');if(input.consent!==true)throw Error('Confirm permission to provide traveler information.');if(!Array.isArray(input.passengers)||input.passengers.length!==b.guests)throw Error('Provide one passenger row per traveler.');
 const date=(s:string)=>/^\d{4}-\d{2}-\d{2}$/.test(s)&&!isNaN(Date.parse(s))&&new Date(s).toISOString().slice(0,10)===s;
 const passengers=input.passengers.map((p:any)=>{const v={name:text(p.name),number:text(p.number,40),expiry:text(p.expiry,10),birth:text(p.birth,10),nationality:text(p.nationality,80)};const present=Object.values(v).filter(Boolean).length;if(present&&present!==5)throw Error('Complete all fields for each passenger you save, or leave the entire row blank.');if(present&&(!date(v.expiry)||v.expiry<b.date||!date(v.birth)||v.birth>new Date().toISOString().slice(0,10)))throw Error('Check passport expiry and date of birth.');return v});
 const received=passengers.filter((p:any)=>p.name).length;const iv=crypto.getRandomValues(new Uint8Array(12));const sealed=await crypto.subtle.encrypt({name:'AES-GCM',iv,additionalData:new TextEncoder().encode(b.id)},await key(),new TextEncoder().encode(JSON.stringify(passengers)));const status=received===b.guests?'Complete':received?'Partially received':'Passport details required';
 await db().prepare('UPDATE records SET data=? WHERE id=?').bind(JSON.stringify({status,received,iv:encode(iv),sealed:encode(new Uint8Array(sealed)),updated:now()}),'passengers:'+b.id).run();await record('admin-log',u.id,{action:'Passenger details updated',target:b.id,status});return {status,received};
}
export async function confirmOperations(b:any){if(b.status!=='test-confirmed')return;const p=(await tourModels())[b.tour];const op=validateOperations(p?.operations);const details=typeof b.data==='string'?JSON.parse(b.data):b.data;
 if(op.ferryIncluded){const inserted=await db().prepare('INSERT OR IGNORE INTO records(id,kind,owner,data,created) VALUES (?,?,?,?,?)').bind('passengers:'+b.id,'passengers',b.owner,JSON.stringify({status:'Passport details required',received:0}),now()).run();if(inserted.meta.changes)await queueEmail('Passenger details required',b.owner,{name:details.name,email:details.email,reference:b.id,message:'Please sign in to your account and securely complete passport details for every traveler on your ferry booking. Never reply with passport information by email.'});}
 for(const supplier of op.suppliers.filter((s:any)=>s.enabled)){const id='supplier-confirmation:'+b.id+':'+supplier.id;const payload={reference:b.id,tour:p.name,date:b.date,travelers:b.guests,role:supplier.role,...(['driver','transport','guide'].includes(supplier.role)?{pickup:details.pickup,pickupTime:details.pickupTime||null}: {})};const inserted=await db().prepare('INSERT OR IGNORE INTO records(id,kind,owner,data,created) VALUES (?,?,?,?,?)').bind(id,'supplier-notification','admin',JSON.stringify({supplier:supplier.name,email:supplier.email,status:'test-outbox',...payload}),now()).run();if(inserted.meta.changes)await queueEmail('Supplier booking notification','admin',{name:supplier.name,email:supplier.email,tour_name:p.name,message:JSON.stringify(payload,null,2)});}
}
export async function operationsStatus(){await requireStaffFor('operations-status');const r=await db().prepare("SELECT id,kind,data FROM records WHERE kind IN ('passengers','supplier-notification')").all<any>();return r.results.map((r:any)=>{const d=JSON.parse(r.data);return r.kind==='passengers'?{booking:r.id.slice(11),kind:r.kind,status:d.status,received:d.received}:{id:r.id,kind:r.kind,...d}});}

export async function reconcileOperations(b:any,type:string,eventId:string){
 const cancelled=type==='booking.cancelled';
 const passenger=await db().prepare("SELECT * FROM records WHERE id=? AND kind='passengers'").bind('passengers:'+b.id).first<any>();
 if(passenger){const old=JSON.parse(passenger.data);if(old.lastEvent!==eventId)await db().prepare('UPDATE records SET data=? WHERE id=?').bind(JSON.stringify({...old,status:cancelled?'Cancelled':'Passport details require review after booking change',reviewRequired:!cancelled,received:0,expected:b.guests,lastEvent:eventId,updated:now()}),passenger.id).run();}
 const suppliers=await db().prepare("SELECT * FROM records WHERE kind='supplier-notification' AND json_extract(data,'$.reference')=?").bind(b.id).all<any>();
 for(const r of suppliers.results){const old=JSON.parse(r.data);if(old.lastEvent===eventId)continue;await db().prepare('UPDATE records SET data=? WHERE id=?').bind(JSON.stringify({...old,status:cancelled?'cancelled':'change-requires-confirmation',date:b.date,travelers:b.guests,lastEvent:eventId,updated:now()}),r.id).run();}
}
