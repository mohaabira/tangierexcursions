export function validatePickupTimes(value:unknown):string[]{
 if(value==null)return [];
 if(!Array.isArray(value)||value.length>96||value.some(t=>typeof t!=='string'||!/^([01]\d|2[0-3]):[0-5]\d$/.test(t))||new Set(value).size!==value.length)throw Error('Use unique pickup times in HH:MM format (00:00–23:59).');
 return [...value].sort();
}
export function pickupLabel(time:string){if(!/^([01]\d|2[0-3]):[0-5]\d$/.test(time))return '';const [h,m]=time.split(':');return `${Number(h)%12||12}:${m} ${Number(h)<12?'am':'pm'}`;}
export function selectedPickup(times:unknown,value:unknown,required=true){const options=validatePickupTimes(times);if(value!=null&&value!==''){if(typeof value!=='string'||!options.includes(value))throw Error('Choose an available pickup time.');return value;}if(required&&options.length)throw Error('Choose your pickup time.');return '';}
