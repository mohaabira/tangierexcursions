export const destinationDefaults=['Malaga','Seville','Tarifa','Gibraltar','Marbella','Cadiz','Fuengirola','Estepona','Rota','Granada','Sotogrande','Tangier','Chefchaouen','Fes','Rabat','Casablanca'].map((name,i)=>({id:name.toLowerCase(),name,country:i<11?(name==='Gibraltar'?'Gibraltar':'Spain'):'Morocco',image:'',enabled:true,tours:[] as string[]}));
export const designDefaults={h1:700,h2:600,h3:500,tourTabsHideHeader:true,compactTourActions:true};
export const normalizePlace=(s:string)=>s.normalize('NFD').replace(/[\u0300-\u036f]/g,'').toLowerCase().replace(/[^a-z0-9]+/g,' ');
