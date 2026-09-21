/** Device preferences are optional: denied storage must never stop the site. */
export function readPreference(key:string,fallback=''){try{return localStorage.getItem(key)??fallback}catch{return fallback}}
export function writePreference(key:string,value:string){try{localStorage.setItem(key,value)}catch{/* Keep the active in-memory preference when browser storage is unavailable. */}}
export function readWishlist():string[]{try{const value=JSON.parse(readPreference('te-wishlist','[]'));return Array.isArray(value)?[...new Set(value.filter((path:unknown):path is string=>typeof path==='string'&&path.startsWith('/')&&!path.startsWith('//')))]:[]}catch{return []}}
