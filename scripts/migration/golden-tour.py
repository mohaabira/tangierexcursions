"""Deterministic, single-tour migration. Does not write the audited source."""
import json,re,hashlib
from pathlib import Path
from bs4 import BeautifulSoup,Tag
ROOT=Path(__file__).resolve().parents[2]
PATH='/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/'
p=next(x for x in json.loads((ROOT/'data/catalog.json').read_text()) if x['path']==PATH)
soup=BeautifulSoup(p['content'],'html.parser')
def txt(n):return n.get_text(' ',strip=True)
def rich(n):return {'text':txt(n),'links':[{'text':txt(a),'href':a['href']} for a in n.find_all('a',href=True) if txt(a)]}
def between(start,end):
 a=next(h for h in soup.find_all('h6') if txt(h)==start);out=[]
 for x in a.next_siblings:
  if isinstance(x,Tag) and x.name=='h6' and txt(x)==end:break
  if isinstance(x,Tag):out.append(x)
 return out
def items(start,end):return [rich(li) for n in between(start,end) for li in n.find_all('li')]
source=[]
def evidence(field,blocks):
 for b in blocks:
  source.append({'id':f'source-{len(source)+1}','field':field,'text':b['text'],'links':b.get('links',[])})
 return blocks
overview=evidence('overview',[rich(soup.find('p'))])
hi=evidence('highlights',items('Highlights','Tangier Day Trip from Tarifa Detailed Itinerary'))
stops=[]
sections=[('Arrive in Tarifa Port','SIGHTSEEING TOUR AROUND TANGIER','Tarifa → Tangier','Tangier Ville port',35.7855,-5.8039),('SIGHTSEEING TOUR AROUND TANGIER','EXPLORE THE KASBAH & MEDINA OF TANGIER','Cape Spartel & Hercules Caves','Cape Spartel',35.7906,-5.9237),('EXPLORE THE KASBAH & MEDINA OF TANGIER','Included','Kasbah & Medina','Tangier Kasbah',35.7881,-5.8132)]
for i,(a,b,title,location,lat,lng) in enumerate(sections):
 blocks=[rich(n) for n in between(a,b) if n.name=='p']
 if i==2:main,ret=blocks[:2],blocks[2:];blocks=main
 evidence('itinerary',blocks)
 stops.append({'id':f'stop-{i+1}','type':'stop','label':f'Stop {i+1}','title':title,'location':location,'description':blocks,'duration':'','image':'','lat':lat,'lng':lng,'mapOrder':i+1,'admission':False,'meal':False,'transport':i<2,'note':''})
evidence('itinerary',ret)
stops.append({'id':'stop-4','type':'stop','label':'Return','title':'Return to the port or your chosen location','location':'Tangier Ville port','description':ret,'duration':'','image':'','lat':35.7855,'lng':-5.8039,'mapOrder':4,'admission':False,'meal':False,'transport':True,'note':''})
# Split only at sentence/paragraph boundaries; retain the original wording and links.
a,b,c,d=stops
first=a['description'][0];cut=first['text'].index(' You will initially')
a['description']=[{**first,'text':first['text'][:cut]}];a.update(title='Arrive in Tarifa Port',location='Tarifa Port',lat=36.0105,lng=-5.6052)
arrival={**a,'title':'Meet your guide in Tangier','location':'Tangier Ville port','lat':35.7855,'lng':-5.8039,'description':[{'text':first['text'][cut:].strip(),'links':[]}]}
coast=b['description'][1];cut=coast['text'].index(' You will have time')
b['description']=[b['description'][0],{**coast,'text':coast['text'][:cut]}];b['title']='Sightseeing & Cape Spartel'
caves={**b,'title':'Hercules Caves & the Atlantic coast','location':'Hercules Caves','lat':35.7601,'lng':-5.9393,'description':[{'text':coast['text'][cut:].strip(),'links':[]}]}
medina={**c,'title':'The Medina, souks & mint tea','location':'Tangier Medina','lat':35.7854,'lng':-5.8106,'description':[c['description'][1]]}
c['title']='Explore the Kasbah';c['description']=[c['description'][0]]
stops=[a,arrival,b,caves,c,medina,d]
for i,stop in enumerate(stops):stop.update(id=f'stop-{i+1}',label=f'Stop {i+1}',mapOrder=i+1)
included=evidence('included',items('Included','Not Included'));excluded=evidence('excluded',items('Not Included','Optional'));optional=evidence('optional',items('Optional','Look it up on the map'))
know=evidence('before',items('Important Information','Frequently Asked Questions'))
faqs=[];q=''
for n in between('Frequently Asked Questions','Reviews'):
 if n.name=='a':q=txt(n)
 elif n.name=='p' and q:
  answer=evidence('faqs',[rich(n)]);source.append({'id':f'source-{len(source)+1}','field':'faqs','text':q,'links':[]});faqs.append({'id':f'faq-{len(faqs)+1}','question':q,'answer':answer});q=''
reviews=[]
for h in soup.find_all('h4'):
 if txt(h) not in ['Great Tour!','Great Personal Service','Absolutely fantastic!','Wonderful Experience']:continue
 body=h.find_next('p');date=str(h.next_sibling).strip();name=str(body.next_sibling).strip();reviews.append({'id':f'legacy-{len(reviews)+1}','title':txt(h),'text':txt(body),'name':name,'date':date,'country':'Australia' if name=='Eric Smith' else '', 'rating':None,'verified':False,'source':'Published website review'})
# Existing cross-sell and trust links remain independently structured, not raw HTML.
links=[]
for a in soup.find_all('a',href=True):
 href=a['href']
 if '#' in href and href.startswith(PATH):continue
 if href=='https://royal-elementor-addons.com/':continue
 label=txt(a)
 if not label:
  if 'google.com' in href:label='Google reviews'
  elif 'tripadvisor.com' in href:label='Tripadvisor reviews'
  elif 'trustpilot.com' in href:label='Trustpilot reviews'
 if label and not any(x['href']==href for x in links):links.append({'text':label,'href':href})
g={'version':1,'path':PATH,'status':'REVIEW REQUIRED','overview':overview,'facts':[{'icon':'clock','label':'Duration','value':'Full day'},{'icon':'users','label':'Tour type','value':'Private'},{'icon':'map','label':'Meeting point','value':'Tangier port or city'},{'icon':'ferry','label':'Ferry tickets','value':'Optional'},{'icon':'language','label':'Guide language','value':'English'},{'icon':'pin','label':'Destination','value':'Tangier'}],'highlights':hi,'itineraryMode':'stop','itinerary':stops,'included':included,'excluded':excluded,'optional':optional,'before':[{'id':f'info-{i+1}','icon':'accessibility' if i==0 else 'info','title':['Accessibility','Other experiences','Ferry confirmation','Meeting your guide'][i],'body':[x]} for i,x in enumerate(know)],'cancellation':{'mode':'custom','body':[]},'faqs':faqs,'reusableIds':[],'reviews':reviews,'links':links,'sectionOrder':['overview','reviews','highlights','itinerary','included','map','cancellation','before','faqs'],'map':{'enabled':True,'pointsReviewed':False},'migration':{'sourceHash':hashlib.sha256(p['content'].encode()).hexdigest(),'sourcePath':'data/catalog.json','segments':source,'checks':{'overview':'MAPPED','highlights':'MAPPED','itinerary':'REVIEW REQUIRED','included':'MAPPED','map':'REVIEW REQUIRED','cancellation':'REVIEW REQUIRED','faqs':'REVIEW REQUIRED'},'notes':{'itinerary':'Sequential mode: the source contains no confirmed stop times. Ferry tickets, camel ride and lunch are optional.','map':'Approximate area coordinates are a proposed visualization, not verified meeting points or navigation directions.','cancellation':'No cancellation policy exists in this tour source. The audited Terms page is a placeholder. Business policy required.','faqs':'Original distance/customs wording is preserved, but requires factual review before future production release.'},'decisions':{},'approvedAt':None}}
(ROOT/'data/golden-tour.json').write_text(json.dumps(g,ensure_ascii=False,indent=2)+'\n')
print(f'Mapped one tour: {len(source)} source blocks, {len(stops)} stops, {len(reviews)} published reviews; other tours untouched.')
