"""Build reviewable map points from named source locations, never rewrite content.
Requires ../cities500.zip from https://download.geonames.org/export/dump/cities500.zip
GeoNames data is licensed CC BY 4.0. Coordinates are approximate city centres.
"""
import json, re, unicodedata, zipfile
from pathlib import Path
root=Path(__file__).resolve().parents[1]
def norm(s):
    return ''.join(c for c in unicodedata.normalize('NFKD',s).lower() if not unicodedata.combining(c))
names={'Tangier':['tangier','tanger'],'Tarifa':['tarifa'],'Seville':['seville','sevilla'],'Málaga':['malaga'],'Marbella':['marbella'],'Cádiz':['cadiz'],'Estepona':['estepona'],'Gibraltar':['gibraltar'],'La Línea de la Concepción':['la linea'],'Fuengirola':['fuengirola'],'Rota':['rota'],'Granada':['granada'],'Sotogrande':['sotogrande'],'Jerez de la Frontera':['jerez'],'Benalmádena':['benalmadena'],'Torremolinos':['torremolinos'],'Ronda':['ronda'],'Chefchaouen':['chefchaouen','chaouen'],'Asilah':['asilah'],'Fes':['fes','fez'],'Rabat':['rabat'],'Casablanca':['casablanca'],'Marrakesh':['marrakech','marrakesh'],'Essaouira':['essaouira'],'Meknès':['meknes'],'Ifrane':['ifrane'],'Azrou':['azrou'],'Midelt':['midelt'],'Erfoud':['erfoud'],'Rissani':['rissani'],'Ouarzazate':['ouarzazate'],'Tinghir':['tinghir','tinerhir'],'Zagora':['zagora'],'Tétouan':['tetouan'],'Algeciras':['algeciras']}
rows=[]
with zipfile.ZipFile(root.parent/'cities500.zip') as z:
    for line in z.read('cities500.txt').decode().splitlines():
        row=line.split('\t')
        if row[8] in ('MA','ES','GI'): rows.append(row)
coords={}
for name,aliases in names.items():
    matches=[r for r in rows if norm(r[1])==norm(name) or norm(r[2])==norm(name)]
    if not matches: matches=[r for r in rows if set(map(norm,r[3].split(','))) & set(map(norm,aliases))]
    if matches:
        r=max(matches,key=lambda r:int(r[14] or 0));coords[name]=(float(r[4]),float(r[5]),r[0])
models=json.loads((root/'data/structured-experiences.json').read_text())
catalog={p['path']:p for p in json.loads((root/'data/catalog.json').read_text())}
golden=json.loads((root/'data/golden-tour.json').read_text())
landmarks={s['location']:s for s in golden['itinerary'] if s.get('lat') is not None}
result={};report=[]
for path,g in models.items():
    if any(s.get('lat') is not None for s in g['itinerary']):continue
    points=[]
    def scan(text,stop=None):
        text=norm(text);found=[]
        for name,aliases in names.items():
            if name not in coords:continue
            positions=[m.start() for alias in aliases for m in re.finditer(r'\b'+re.escape(norm(alias))+r'\b',text)]
            if positions:found.append((min(positions),name))
        for _,name in sorted(found):
            if points and points[-1]['location']==name:continue
            lat,lng,gid=coords[name]
            points.append({'id':f'route-{len(points)+1}','title':name,'location':name,'description':[], 'lat':lat,'lng':lng,'mapOrder':len(points)+1,'coordinateSource':'GeoNames '+gid,**({'sourceStopId':stop['id']} if stop else {})})
    for s in g['itinerary']:
        scan(' '.join(str(s.get(k,'')) for k in ('title','location','route')),s)
        for e in s.get('events',[]):scan(e.get('location','')+' '+e.get('title',''),e)
    if len(points)<2:
        scan(catalog[path]['name'])
        scan(' '.join(b['text'] for b in g['overview']))
    # Retain existing landmark coordinates only where the source actually names it.
    text=norm(json.dumps(g['itinerary'],ensure_ascii=False))
    for name,s in landmarks.items():
        if norm(name) in text and not any(p['location']==name for p in points):
            points.append({'id':f'route-{len(points)+1}','title':name,'location':name,'description':[],'lat':s['lat'],'lng':s['lng'],'mapOrder':len(points)+1,'coordinateSource':'Existing Golden Tour landmark'})
    # Text order is not a verified travel sequence. Keep unique named locations;
    # the UI suppresses connecting lines until an administrator reviews the order.
    unique=[]
    for point in points:
        if not any(p['location']==point['location'] for p in unique):
            unique.append({**point,'id':f'route-{len(unique)+1}','mapOrder':len(unique)+1})
    points=unique
    if points:result[path]=points
    report.append({'path':path,'points':len(points),'status':'Approximate locations — review required' if points else 'No verified named location found'})
(root/'data/tour-route-points.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
(root/'migration/ROUTE-LOCATION-SOURCES.json').write_text(json.dumps({'source':'https://download.geonames.org/export/dump/cities500.zip','license':'CC BY 4.0','note':'Approximate named city centres; lines are not road directions. Existing Golden Tour coordinates preserved.','tours':report},ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'additionalMaps':len(result),'points':sum(map(len,result.values())),'missing':[r for r in report if not r['points']]}))
