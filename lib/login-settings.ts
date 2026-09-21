import {authStatus} from './customer-auth';
import {db,requireUser,record} from './server';
import {loginDefaults,validateLoginSettings} from './login-settings-schema';
const key='customer-login-setup';
export async function loginSettings(){
  await requireUser(true);
  const row=await db().prepare('SELECT value FROM settings WHERE key=?').bind(key).first<{value:string}>();
  return {settings:row?{...loginDefaults,...JSON.parse(row.value)}:loginDefaults,status:await authStatus(),stage:'implemented'};
}
export async function saveLoginSettings(body:any){
  const actor=await requireUser(true),value=validateLoginSettings(body);
  const expected=value.revision; value.revision=crypto.randomUUID();
  const result=expected
    ?await db().prepare("UPDATE settings SET value=? WHERE key=? AND json_extract(value,'$.revision')=?").bind(JSON.stringify(value),key,expected).run()
    :await db().prepare('INSERT OR IGNORE INTO settings(key,value) VALUES(?,?)').bind(key,JSON.stringify(value)).run();
  if(!result.meta.changes) throw Error('These settings changed in another window. Reload before saving again.');
  await record('admin-log',actor.id,{action:'Customer login setup saved',target:'Login & security'});
  return {settings:value,status:await authStatus(),stage:'implemented'};
}
