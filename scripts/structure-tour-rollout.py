"""Deterministic source-preserving migration. No network or source-file mutation."""
import json,re,hashlib
from bs4 import BeautifulSoup
from pathlib import Path
catalog=json.load(open('data/catalog.json')); sections=json.load(open('data/discovery-content.json')); models=json.load(open('data/structured-tours.json')); golden=json.load(open('data/golden-tour.json'))
def text(n):return re.sub(r'\s+',' ',n.get_text(' ',strip=True)).strip()
def block(n):return {'text':text(n),'links':[{'text':text(a),'href':a['href']} for a in n.find_all('a',href=True) if text(a)]}
def nodes(html):
 soup=BeautifulSoup(html,'html.parser')
 return [n for n in soup.find_all(['p','li','h2','h3','h4','h5','h6','a','summary']) if text(n) and not (n.name=='a' and n.find_parent(['p','li','h2','h3','h4','h5','h6'])) and not (n.name=='p' and n.find_parent('li'))]
def stop(title,index,kind='stop',label=''):
 return {'id':'source-stop-'+str(index),'type':kind,'label':label,'title':title,'location':'','description':[],'duration':'','image':'','lat':None,'lng':None,'mapOrder':index,'admission':False,'meal':False,'transport':False,'note':'','events':[],'route':'','accommodation':'','meals':'','distance':'','drivingTime':'','activities':''}
noise={'Highlights','Itinerary','Included','Not Included','Map','Rates','FAQs','Reviews','Prices','Detailed Itinerary','Frequently Asked Questions','Look it up on the map','Book Now','0','Overview','Important Information','Morocco Trip Detailed Itinerary'}
result={};report=[]
for page in catalog:
 if page['kind']!='tour':continue
 path=page['path']
 if path==golden['path']:result[path]=golden;continue
 model=models[path];source=sections.get(path,{})
 g={'version':2,'path':path,'status':'REVIEW REQUIRED','overview':[],'facts':[],'highlights':[],'itineraryMode':'stop','timeFormat':'24','itinerary':[],'included':[],'excluded':[],'optional':[],'before':[],'cancellation':{'mode':'custom','body':[]},'faqs':[],'reusableIds':[],'reviews':[],'links':[],'sectionOrder':golden['sectionOrder'],'hiddenSections':[],'map':{'enabled':False,'pointsReviewed':False},'migration':{'sourceHash':hashlib.sha256(page['content'].encode()).hexdigest(),'sourcePath':path,'segments':[],'checks':{},'notes':{},'decisions':{},'approvedAt':None}}
 seen=set()
 def remember(b,field):
  if b['text'] in seen:return False
  seen.add(b['text']);g['migration']['segments'].append({'id':'source-'+str(len(seen)), 'field':field,**b});return True
 def append(b,field,target):
  if remember(b,field):target.append(b)
 for key,label,icon in [('duration','Duration','clock'),('origin','Starting location','pin'),('destination','Destination','map'),('tourType','Tour type','users')]:
  if model.get(key):g['facts'].append({'label':label,'value':model[key],'icon':icon})
 for field,html in source.items():
  ns=nodes(html)
  if field=='reviews':
   soup=BeautifulSoup(html,'html.parser')
   for h in soup.find_all('h4'):
    container=h.parent
    if container.name!='p':continue
    paragraphs=container.find_all('p',recursive=False)
    review_text='\n\n'.join(text(n) for n in paragraphs if text(n))
    if not review_text:continue
    loose=[str(n).strip() for n in container.contents if isinstance(n,str) and str(n).strip()]
    date=next((v for v in loose if re.search(r'\b20\d{2}\b',v)),'')
    author=next((v for v in reversed(loose) if v!=date),'Guest')
    g['reviews'].append({'id':'imported-'+str(len(g['reviews'])+1),'title':text(h),'text':review_text,'name':author,'date':date,'rating':None,'verified':False,'source':'Audited review'})
   continue
  if field=='related':continue
  if field=='itinerary':
   current=None;event=None
   for n in ns:
    t=text(n)
    if t in noise:continue
    day=re.match(r'^Day\s*(\d+)\s*[:.\-–—]*(.*)',t,re.I)
    clock=re.match(r'^(?:Approx\.?\s*)?(\d{1,2}[:.]\d{2}\s*(?:[ap]\.?m\.?)?)\s*[:\-–—]*(.*)',t,re.I)
    heading=n.name.startswith('h') or bool(day) or bool(clock) or (n.name=='p' and n.find('strong') and text(n.find('strong'))==t and len(t)<160)
    if heading:
     if day:
      current=stop(day.group(2).strip() or t,len(g['itinerary'])+1,'day','Day '+day.group(1));g['itineraryMode']='day';g['itinerary'].append(current);event=None
     elif clock and current and current['type']=='day':
      event=stop(clock.group(2).strip() or t,len(current['events'])+1,'time',clock.group(1));event['id']=current['id']+'-event-'+str(len(current['events'])+1);current['events'].append(event)
     else:
      current=stop(clock.group(2).strip() if clock and clock.group(2).strip() else t,len(g['itinerary'])+1,'time' if clock else 'stop',clock.group(1) if clock else '');g['itinerary'].append(current);event=None
     remember(block(n),'itinerary')
    else:
     if not current:current=stop('Your journey',1);g['itinerary'].append(current)
     append(block(n),'itinerary',(event or current)['description'])
   if g['itineraryMode']!='day' and any(s['type']=='time' for s in g['itinerary']):g['itineraryMode']='time'
   continue
  if field=='faqs':
   faq=None;extra=[]
   for n in ns:
    t=text(n)
    if t in noise:continue
    if (n.name in ['a','summary'] or n.name.startswith('h')) and '?' in t and len(t)<500:
     faq={'id':'faq-'+str(len(g['faqs'])+1),'question':t,'answer':[]};g['faqs'].append(faq);remember(block(n),'faqs')
    else:append(block(n),'faqs' if faq else 'before',faq['answer'] if faq else extra)
   if extra:g['before'].append({'id':'source-faq-information','title':'Further travel information','icon':'info','body':extra})
   continue
  if field in ['overview','highlights','included','excluded']:
   for n in ns:
    t=text(n)
    if t in noise:continue
    if n.name.startswith('h') and (t==page['name'] or t.lower().startswith(('best ','what to expect','why book'))):continue
    target=field
    if field=='highlights' and n.name=='p':target='overview'
    append(block(n),target,g[target])
   continue
  body=[];title={'know':'Before you go','pricing':'Pricing information','cancellation':'Cancellation Policy'}.get(field,field.replace('_',' ').title())
  for n in ns:
   if text(n) not in noise:append(block(n),'cancellation' if field=='cancellation' else 'before',body)
  if field=='cancellation':g['cancellation']['body']=body
  elif body:g['before'].append({'id':'source-'+field,'title':title,'icon':'info','body':body})
 # Move excess overview paragraphs into a named expandable information group, not a second copy.
 if len(g['overview'])>3:
  rest=g['overview'][3:];g['overview']=g['overview'][:3];g['before'].insert(0,{'id':'experience-details','title':'More about this experience','icon':'info','body':rest})
  for seg in g['migration']['segments']:
   if seg['field']=='overview' and any(b['text']==seg['text'] for b in rest):seg['field']='before'
 for key in ['overview','highlights','itinerary','included','faqs']:g['migration']['checks'][key]='MAPPED' if g[key] and key!='itinerary' else 'REVIEW REQUIRED'
 g['migration']['checks'].update({'map':'REVIEW REQUIRED','cancellation':'MAPPED' if g['cancellation']['body'] else 'REVIEW REQUIRED'})
 g['migration']['relatedPaths']=list(dict.fromkeys(a['href'] for a in BeautifulSoup(page['content'],'html.parser').find_all('a',href=True) if a['href']!=path and any(p['path']==a['href'] and p['kind']=='tour' for p in catalog)))
 g['migration']['notes']={'itinerary':'Confirm source pickup times, return city, day numbering and accommodation. Source schedules may conflict; nothing has been silently corrected.','map':'No itinerary coordinates have been invented. Add and review route locations to enable the map.','cancellation':'Confirm the audited policy or select a reviewed reusable policy before content approval.'}
 result[path]=g;report.append({'path':path,'paragraphs':len(seen),'itineraryMode':g['itineraryMode'],'stops':len(g['itinerary']),'nestedEvents':sum(len(s['events']) for s in g['itinerary']),'faqs':len(g['faqs'])})
Path('data/structured-experiences.json').write_text(json.dumps(result,ensure_ascii=False,separators=(',',':')))
Path('migration/TOUR-ROLLOUT-INVENTORY.json').write_text(json.dumps(report,ensure_ascii=False,indent=2))
print('Structured',len(result),'tours;',sum(r['nestedEvents'] for r in report),'nested itinerary events; original catalog unchanged.')
