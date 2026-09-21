export const adminGroups = [
 {label:'Dashboard',icon:'home',items:['Dashboard']},
 {label:'Bookings',icon:'calendar',items:['Bookings','Calendar','Gifts']},
 {label:'Tours',icon:'compass',items:['Tours','Transfers','Trip types','Activities','Destinations','Destination pages','Starting locations','Duration','Pricing','Availability','Reviews','Tour Content Review']},
 {label:'Customers',icon:'users',items:['Customers','Enquiries']},
 {label:'Content',icon:'files',items:['Homepage','Pages','Blog','About Us','Help Center','Media library','Reusable Information','Email templates']},
 {label:'Partners',icon:'partners',items:['Partners']},
 {label:'Operations',icon:'route',items:['Operations','Transfer routes','Maps']},
 {label:'Payments',icon:'wallet',items:['Payments']},
 {label:'Marketing',icon:'marketing',items:['Marketing Overview','SEO & AI Visibility','Landing Pages','Internal Linking','Content Performance','Tracking & Attribution','Marketing Settings','Coupons','Homepage offers','Social & footer']},
 {label:'Analytics',icon:'chart',items:['Analytics','Search & discovery']},
 {label:'Settings',icon:'settings',items:['Company details','Settings','Languages','Appearance','Users','Login & security','Integrations','Change history']},
];
export const adminScreens = adminGroups.flatMap(g=>g.items);
export const screenSlug=(name:string)=>name.toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/-$/,'');
export const screenFromSlug=(slug:string)=>adminScreens.find(s=>screenSlug(s)===slug)||'Dashboard';
