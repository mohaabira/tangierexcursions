import json,pathlib,re,urllib.parse,urllib.request,concurrent.futures
from bs4 import BeautifulSoup
R=pathlib.Path(__file__).resolve().parents[1];rows=json.loads((R/'data/catalog.json').read_text());urls=set()
for p in rows:
 p['pricing']=[]
 for table in p.get('tables',[]):
  if 'Cost Per Person' not in table:continue
  left,right=table.split('Cost Per Person',1);labels=[x.strip() for x in left.split('|') if re.fullmatch(r'\+?\d+(?:\s*[-–]\s*\d+)?',x.strip())];prices=re.findall(r'€\s*([\d,.]+)',right)
  if len(labels)!=len(prices):continue
  for label,price in zip(labels,prices):
   n=[int(x) for x in re.findall(r'\d+',label)];p['pricing'].append({'min':n[0],'max':99 if label.startswith('+') else n[-1],'price':float(price.replace(',',''))})
 s=BeautifulSoup(p.get('content',''),'html.parser')
 p['sections']=[{'title':h.get_text(' ',strip=True),'id':'section-'+str(i)} for i,h in enumerate(s.select('h2,h3'))]
 for i,h in enumerate(s.select('h2,h3')):h['id']='section-'+str(i)
 for a in s.select('a[href]'):
  u=urllib.parse.urlsplit(a['href'])
  if u.netloc in ['www.tangierexcursions.com','tangierexcursions.com']:a['href']=u.path+('?' +u.query if u.query else '')+('#'+u.fragment if u.fragment else '')
 for img in s.select('img[src]'):
  if '/wp-content/uploads/' in img['src']:urls.add(img['src']);img['src']=urllib.parse.urlsplit(img['src']).path
 p['content']=str(s)
 for image in p['gallery']:urls.add(image)
 p['gallery']=[urllib.parse.urlsplit(x).path for x in p['gallery']]
 for image in p['images']:
  u=image.get('src','')
  if '/wp-content/uploads/' in u:urls.add(u)
(R/'data/catalog.json').write_text(json.dumps(rows,ensure_ascii=False))
print('Pricing imported:',sum(bool(p['pricing']) for p in rows),'Media:',len(urls),flush=True)
def download(u):
 try:
  path=R/'public'/urllib.parse.unquote(urllib.parse.urlsplit(u).path).lstrip('/');path.parent.mkdir(parents=True,exist_ok=True)
  if not path.exists():path.write_bytes(urllib.request.urlopen(u,timeout=35).read())
  return {'url':u,'path':str(path.relative_to(R/'public')),'ok':True}
 except Exception as e:return {'url':u,'ok':False,'error':str(e)}
with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
 result=list(pool.map(download,sorted(urls)))
(R/'migration/media-manifest.json').write_text(json.dumps(result,indent=2));print('Media saved:',sum(x['ok'] for x in result),flush=True)
