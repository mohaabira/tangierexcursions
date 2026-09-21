import json,pathlib,urllib.request,urllib.parse,concurrent.futures,re,hashlib
from bs4 import BeautifulSoup
ROOT=pathlib.Path(__file__).resolve().parents[1]
rows=json.loads((ROOT/'data/catalog.json').read_text())
def get(url):
 return urllib.request.urlopen(urllib.request.Request(url,headers={'User-Agent':'TangierExcursionsReadOnlyMigration/1.0'}),timeout=40).read()
def extract(r):
 file=ROOT/'migration/source-pages'/(hashlib.sha256(r['url'].encode()).hexdigest()[:16]+'.html')
 try:
  if not file.exists():file.write_bytes(get(r['url']))
  s=BeautifulSoup(file.read_bytes(),'html.parser');main=s.select_one('main') or s.body
  for el in main.select('script,style,form,iframe,nav,button,input,select,textarea,svg,noscript,header,footer'):el.decompose()
  # Preserve meaningful HTML and original URLs; remove WordPress presentation scaffolding.
  allowed={'p','a','h1','h2','h3','h4','h5','h6','ul','ol','li','table','thead','tbody','tr','th','td','strong','b','em','i','br','img','blockquote','figure','figcaption','hr'}
  for el in list(main.find_all(True)):
   if el.name not in allowed:el.unwrap();continue
   attrs={k:v for k,v in el.attrs.items() if k in ('href','src','alt','title','colspan','rowspan','width','height')}
   for key in ['href','src']:
    if key in attrs:
     url=urllib.parse.urljoin(r['url'],attrs[key])
     if urllib.parse.urlsplit(url).scheme not in ('http','https','mailto','tel'):attrs.pop(key,None)
     else:attrs[key]=url
   if el.name=='img':attrs['loading']='lazy'
   el.attrs=attrs
  r['content']=''.join(str(x) for x in main.contents)
  r['text']=main.get_text(' ',strip=True)
  r['tables']=[t.get_text(' | ',strip=True) for t in main.find_all('table')]
  r['import_status']='complete'
 except Exception as e:r['import_status']='failed';r['import_error']=str(e)
 return r
with concurrent.futures.ThreadPoolExecutor(max_workers=5) as pool:
 result=[]
 for r in pool.map(extract,rows):
  result.append(r);print(len(result),r['import_status'],r['path'],flush=True)
  (ROOT/'data/catalog.json').write_text(json.dumps(result+rows[len(result):],ensure_ascii=False))
(ROOT/'data/catalog.json').write_text(json.dumps(result,ensure_ascii=False))
