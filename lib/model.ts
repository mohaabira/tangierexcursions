import type {Tier} from './shared';
import catalog from '@/data/catalog.json';
export type Tour=typeof catalog[number];
export const pages=catalog;
export const tours=pages.filter(p=>p.kind==='tour');
export const logo=pages[0].images[0].src;
export function baseTiers(p:Tour):Tier[]{const found=(p as any).pricing as Tier[]|undefined;return found?.length?found:[];}
export * from './shared';
