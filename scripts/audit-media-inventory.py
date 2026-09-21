"""Refresh the public media inventory at build/edit time, never per visitor request."""
import json
from pathlib import Path
from PIL import Image
root=Path('public')
items={}
for p in root.rglob('*'):
    if not p.is_file() or p.suffix.lower() not in {'.png','.jpg','.jpeg','.webp','.avif','.gif','.svg'}: continue
    v={'size':p.stat().st_size,'format':p.suffix[1:].lower()}
    try:
        with Image.open(p) as im: v.update(width=im.width,height=im.height)
    except Exception: pass
    items['/'+p.relative_to(root).as_posix()]=v
Path('data/media-inventory.json').write_text(json.dumps(items,separators=(',',':')))
print(f'Indexed {len(items)} local images')
