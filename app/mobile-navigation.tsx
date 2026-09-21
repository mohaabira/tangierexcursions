'use client';
import {useState} from 'react';
import {Gift,Building2,Menu,Ship,Car,Compass,MapPin,ChevronRight,ArrowLeft,Globe,Wallet,User,Heart,MessageCircle,Check} from 'lucide-react';
import {Sheet,SheetContent,SheetTitle,SheetDescription,SheetTrigger,SheetClose} from '@/components/ui/sheet';
import {RadioGroup,RadioGroupItem} from '@/components/ui/radio-group';
import {currencyNames,languageNames,usePreferenceViewport} from './travel-preferences';

export function MobileNavigation({cfg,lang,setLang,currency,setCurrency,user,signin,custom}:any){
 const [open,setOpen]=useState(false),[panel,setPanel]=useState('menu'),[busy,setBusy]=useState(false),[error,setError]=useState('');
 const viewport=usePreferenceViewport(open);
 const names=lang==='fr'?['Espagne → Maroc','Transferts','Excursions à la journée']:lang==='es'?['España → Marruecos','Traslados','Excursiones de un día']:['Spain to Morocco','Transfers','Day Trips'];
 const links=[{href:'/morocco-tours-from-spain/',name:names[0],detail:'Across the Strait, your way',Icon:Ship},{href:'/tangier-taxi/',name:names[1],detail:'Airport, city & private journeys',Icon:Car},{href:'/tangier-day-trips/',name:names[2],detail:'Make a day of discovery',Icon:Compass}];
 async function choose(value:string){setBusy(true);setError('');try{await (panel==='language'?setLang(value):setCurrency(value));setPanel('menu')}catch{setError('Your preference could not be saved. Please try again.')}finally{setBusy(false)}}
 return <Sheet open={open} onOpenChange={v=>{setOpen(v);if(!v){setPanel('menu');setError('')}}}>
 <SheetTrigger className="icon-btn mobile-menu" aria-label="Open navigation"><Menu/></SheetTrigger>
 <SheetContent className="mobile-navigation" style={viewport} onCloseAutoFocus={()=>setPanel('menu')}>
 <div className="mobile-nav-brand"><SheetClose asChild><a href="/" aria-label="Tangier Excursions home"><img src={cfg.company?.logos?.dark||cfg.company?.logos?.primary||'/assets/brand/primary.png'} width="207" height="69" alt="Tangier Excursions"/></a></SheetClose></div>
 <div className="mobile-nav-body">
 {panel==='menu'?<>
 <SheetTitle className="mobile-nav-title">Where will your journey take you?</SheetTitle><SheetDescription className="sr-only">Explore trips, your account and travel preferences.</SheetDescription>
 <nav aria-label="Mobile navigation" className="mobile-journey-links">{links.map(({href,name,detail,Icon})=><SheetClose asChild key={href}><a href={href}><span className="mobile-link-icon"><Icon size={23}/></span><span><strong>{name}</strong><small>{detail}</small></span><ChevronRight size={18}/></a></SheetClose>)}</nav>
 <div className="mobile-secondary-links">{[...(cfg.commerce?.giftHeader?[[Gift,'Gift an experience','/gifts/']]:[]),...(cfg.commerce?.partnerHeader?[[Building2,'Partner with us','/partners/']]:[]),...(cfg.commerce?.partnerLogin?[[Building2,'Partner login','/login/?next=%2Fpartners%2Fportal%2F']]:[]),[MapPin,'Destinations','/destinations/'],[Compass,'All experiences','/search/'],[Heart,'Wishlist','/wishlist/'],[MessageCircle,'Travel Help Center','/faqs/'],[MessageCircle,'Contact us','/transport_booking/']].map(([Icon,label,href]:any)=><SheetClose asChild key={href}><a href={href}><Icon size={19}/>{label}<ChevronRight size={16}/></a></SheetClose>)}<button onClick={()=>{setOpen(false);custom()}}><MessageCircle size={19}/>Help & custom trips<ChevronRight size={16}/></button></div>
 <div className="mobile-nav-preferences"><button onClick={()=>setPanel('language')} aria-label="Choose language"><Globe size={20}/><span><small>Language</small><strong>{languageNames[lang]||lang}</strong></span><ChevronRight size={16}/></button><button onClick={()=>setPanel('currency')} aria-label="Choose currency"><Wallet size={20}/><span><small>Currency</small><strong>{currencyNames[currency]?.[0]} {currency}</strong></span><ChevronRight size={16}/></button></div>
 <div className="mobile-nav-account">{user?<SheetClose asChild><a href="/account/"><User size={20}/><span>My account & bookings</span><ChevronRight size={17}/></a></SheetClose>:<button onClick={()=>{setOpen(false);signin()}}><User size={20}/><span>Sign in to plan your journey</span><ChevronRight size={17}/></button>}</div>
 </>:<>
 <button className="mobile-nav-back" onClick={()=>setPanel('menu')}><ArrowLeft size={19}/>Back to menu</button>
 <SheetTitle className="mobile-nav-title">{panel==='language'?'Choose your language':'Choose your currency'}</SheetTitle>
 <SheetDescription className="mobile-preference-note">{panel==='language'?'Navigation updates immediately. Tour content uses reviewed translations where available.':'Prices are converted for planning. Bookings settle in EUR.'}</SheetDescription>
 <RadioGroup className="mobile-preference-options" disabled={busy} aria-label={panel==='language'?'Language':'Currency'} value={panel==='language'?lang:currency} onValueChange={choose}>{(panel==='language'?Object.keys(languageNames):Object.keys(cfg.currencies||{EUR:1})).map(v=><label key={v} className="mobile-preference-choice"><RadioGroupItem value={v}/><span><strong>{panel==='language'?languageNames[v]:v}</strong><small>{panel==='language'?v.toUpperCase():currencyNames[v]?.[1]||v}</small></span>{(panel==='language'?lang:currency)===v&&<Check size={20}/>}</label>)}</RadioGroup>
 {busy&&<p role="status">Saving your preference…</p>}{error&&<p role="alert">{error}</p>}
 </>}
 </div></SheetContent></Sheet>
}
