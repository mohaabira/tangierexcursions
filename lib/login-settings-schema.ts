export const loginDefaults = {
  liveOrigin: '',
  service: {url:'',publishableKey:''},
  google: { planned: true, clientId: '', callbackUrl: '' },
  facebook: { planned: true, appId: '', callbackUrl: '' },
  email: { planned: true, senderName: 'Tangier Excursions', senderEmail: '', replyTo: '', verificationMinutes: 30,
    subject: 'Verify your email — Tangier Excursions',
    message: 'Welcome to Tangier Excursions. Please verify your email to finish creating your account and keep your bookings and saved journeys in one place.' },
  revision: '',
};
export function validateLoginSettings(input: any) {
  if (!input || typeof input !== 'object' || Array.isArray(input)) throw Error('Invalid login settings.');
  // Credentials belong in the live authentication service, never ordinary CMS settings.
  if (/secret|password|api.?key|token/i.test(JSON.stringify(Object.keys(input))) ||
      [input.google,input.facebook,input.email].some(v => v && /secret|password|api.?key|token/i.test(JSON.stringify(Object.keys(v)))))
    throw Error('Keep private credentials in your live authentication service.');
  const text = (v: any, label: string, max: number) => {
    if (typeof v !== 'string' || v.length > max || /[\u0000-\u0008\u000b\u000c\u000e-\u001f]/.test(v)) throw Error('Check '+label+'.');
    return v.trim();
  };
  const url = (v: any, label: string, originOnly=false) => {
    const value=text(v,label,1000); if (!value) return '';
    try { const u=new URL(value); if(u.protocol!=='https:' || u.username || u.password || u.hash || (originOnly && (u.pathname!=='/' || u.search))) throw Error(); return originOnly?u.origin:u.href; }
    catch { throw Error('Use a complete HTTPS '+label+(originOnly?' without a page path.':'.')); }
  };
  const planned=(v:any) => { if(typeof v!=='boolean') throw Error('Choose whether to prepare each login method.'); return v; };
  const address=(v:any,label:string) => { const value=text(v,label,254); if(value&&!/^[^\s@<>]+@[^\s@<>]+\.[^\s@<>]+$/.test(value)) throw Error('Enter a valid '+label+'.'); return value; };
  const minutes=input.email?.verificationMinutes;
  if(!Number.isInteger(minutes)||minutes<5||minutes>1440) throw Error('Verification expiry must be 5–1440 minutes.');
  const serviceUrl=url(input.service?.url||'', 'Supabase project URL',true);
  if(serviceUrl&&!/^https:\/\/[a-z0-9-]+\.supabase\.co$/.test(serviceUrl))throw Error('Use your hosted Supabase project URL.');
  const publishableKey=text(input.service?.publishableKey||'','Supabase publishable key',300);
  if(publishableKey&&!/^sb_publishable_[A-Za-z0-9_-]+$/.test(publishableKey))throw Error('Use a Supabase publishable key, never a secret or service-role key.');
  return {
    service:{url:serviceUrl,publishableKey},
    liveOrigin:url(input.liveOrigin,'website address',true),
    google:{planned:planned(input.google?.planned),clientId:text(input.google?.clientId,'Google client ID',300),callbackUrl:url(input.google?.callbackUrl,'Google callback URL')},
    facebook:{planned:planned(input.facebook?.planned),appId:text(input.facebook?.appId,'Facebook app ID',100),callbackUrl:url(input.facebook?.callbackUrl,'Facebook callback URL')},
    email:{planned:planned(input.email?.planned),senderName:text(input.email?.senderName,'sender name',100),senderEmail:address(input.email?.senderEmail,'sender email'),replyTo:address(input.email?.replyTo,'reply-to email'),verificationMinutes:minutes,subject:text(input.email?.subject,'verification subject',160),message:text(input.email?.message,'verification message',2000)},
    revision:text(input.revision,'saved revision',100),
  };
}
