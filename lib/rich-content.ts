import sanitize from 'sanitize-html';

const inlineTags=['strong','b','em','i','u','s','span','a','br','img'];
export function cleanRich(value:unknown,inline=false){
 const input=String(value??'');
 if(input.length>180000)throw Error('Content is too long. Split it into smaller sections.');
 return sanitize(inline?input.replace(/<\/p>/gi,'<br>'):input,{
  allowedTags:inline?inlineTags:[...inlineTags,'p','h2','h3','h4','ul','ol','li','blockquote','hr','figure','figcaption','table','thead','tbody','tr','th','td'],
  allowedAttributes:{a:['href','target','rel'],img:['src','alt','title'],span:['style'],p:['style','id'],h2:['style','id'],h3:['style','id'],h4:['style','id'],ol:['start'],td:['colspan','rowspan'],th:['colspan','rowspan']},
  allowedStyles:{'*':{'font-weight':[/^[4-8]00$/],'text-align':[/^(left|center|right)$/]}},
  allowedSchemes:['http','https','mailto','tel'],allowedSchemesByTag:{img:['https']},allowProtocolRelative:false,
  transformTags:{a:(_tag,attrs)=>({tagName:'a',attribs:{...attrs,...(attrs.target==='_blank'?{rel:'noopener noreferrer'}:{target:'_self'})}})},
  exclusiveFilter:frame=>frame.tag==='img'&&!/^(\/(?:media\/|wp-content\/|assets\/)|https:\/\/)/.test(frame.attribs.src||''),
 });
}
export function richPlain(html:string){return sanitize(html,{allowedTags:[],allowedAttributes:{}}).replace(/\s+/g,' ').trim();}
