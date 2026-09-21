"""Prepare semantic editorial layouts while retaining original catalog snapshots."""
import json,re,hashlib
from bs4 import BeautifulSoup,NavigableString
from pathlib import Path
catalog=json.load(open('data/catalog.json'));result={}
def flat(v):
 if isinstance(v,list):
  for x in v:yield from flat(x)
 elif isinstance(v,dict):
  yield v
  for x in v.values():yield from flat(x)
for p in catalog:
 if p['kind']=='tour' or p['path']=='/':continue
 soup=BeautifulSoup(p['content'],'html.parser')
 for n in list(soup.find_all(string=True)):
  if re.fullmatch(r'\s*(?:[.#][\w-]+\s*)+',str(n)):n.extract()
 for n in soup.find_all(['script','style','form','iframe']):n.decompose()
 for h in list(soup.find_all('h1')):
  h.name='h2'
  if h==soup.find(['h2','h3']) and h.get_text(' ',strip=True).lower().replace('?','') in [p['name'].lower().replace('?',''),(p.get('h1') or [''])[0].lower().replace('?','') if isinstance(p.get('h1'),list) else '']:
   h.decompose()
 for h in list(soup.find_all(['h2','h3'])):
  if h.get_text(' ',strip=True).lower()=='table of contents':
   nxt=h.find_next_sibling()
   if nxt and nxt.name in ['ul','ol'] and all(a.get('href','').startswith('#') for a in nxt.find_all('a')):nxt.decompose()
   h.decompose()
 for img in soup.find_all('img'):img['loading']='lazy';img['decoding']='async'
 for a in list(soup.find_all('a')):
  if not a.get_text(strip=True) and not a.find('img'):a.decompose()
 toc=[];used=set()
 for i,h in enumerate(soup.find_all(['h2','h3'])):
  title=h.get_text(' ',strip=True)
  if not title:continue
  id=h.get('id') or 'guide-section-'+str(i+1)
  if id in used:id+='-'+str(i+1)
  used.add(id);h['id']=id
  if len(title)>4 and not re.fullmatch(r'\d{1,2}:\d{2}',title):toc.append({'id':id,'title':title,'level':int(h.name[1])})
 text=soup.get_text(' ',strip=True);metadata=[]
 for raw in p.get('structured_data',[]):
  try:metadata.extend(flat(json.loads(raw)))
  except:pass
 article=next((x for x in metadata if any(t in ['BlogPosting','Article'] for t in ([x.get('@type')] if isinstance(x.get('@type'),str) else x.get('@type',[])))),{})
 author=article.get('author',{});author=author[0] if isinstance(author,list) and author else author
 date=article.get('datePublished','')
 if not date:
  m=re.search(r'Post published:\s*([A-Za-z]+\s+\d{1,2},\s*\d{4})',text);date=m.group(1) if m else ''
 related=list(dict.fromkeys(a['href'] for a in soup.find_all('a',href=True) if any(t['path']==a['href'] and t['kind']=='tour' for t in catalog)))
 cat=p['path'].split('/')[1];category={'morocco-travel-tips':'Travel Tips','culture':'Culture','news':'News'}.get(cat,'Travel planning')
 result[p['path']]={'html':str(soup),'toc':toc,'words':len(text.split()),'minutes':max(1,round(len(text.split())/220)),'published':date,'author':author.get('name','') if isinstance(author,dict) else '','category':category,'relatedTours':related,'sourceHash':hashlib.sha256(p['content'].encode()).hexdigest()}
Path('data/editorial-content.json').write_text(json.dumps(result,ensure_ascii=False,separators=(',',':')))
print('Prepared',len(result),'editorial pages; original catalog unchanged')
