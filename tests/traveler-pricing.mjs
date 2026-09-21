import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
import ts from 'typescript';
const dir=fs.mkdtempSync(path.join(os.tmpdir(),'te-pricing-'));
for(const name of ['shared','pickup-times','pricing']){const source=fs.readFileSync(new URL('../lib/'+name+'.ts',import.meta.url),'utf8').replace("'./shared'","'./shared.mjs'").replace("'./pickup-times'","'./pickup-times.mjs'");fs.writeFileSync(path.join(dir,name+'.mjs'),ts.transpileModule(source,{compilerOptions:{module:ts.ModuleKind.ESNext,target:ts.ScriptTarget.ES2022}}).outputText)}
const {priceQuote}=await import(pathToFileURL(path.join(dir,'pricing.mjs')));
process.on('exit',()=>fs.rmSync(dir,{recursive:true,force:true}));
const config={tiers:[{min:1,max:99,price:100,basis:'person'}],childPrice:50,infantPrice:0};
test('adult and child prices produce exact cent totals',()=>{const q=priceQuote(config,{adults:2,children:1});assert.equal(q.total,25000);assert.equal(q.guests,3)});
test('legacy infant selections become children without losing a traveler',()=>{const q=priceQuote(config,{adults:2,children:1,infants:1});assert.equal(q.total,30000);assert.equal(q.children,2);assert.equal(q.infants,0);assert.equal(q.guests,4)});
test('legacy infant rates are ignored when no child rate is configured',()=>{assert.equal(priceQuote({...config,childPrice:null},{adults:1,infants:1}).total,20000)});
test('group pricing remains a single group price',()=>{assert.equal(priceQuote({...config,tiers:[{min:1,max:99,price:300,basis:'group'}]},{adults:2,children:1,infants:1}).total,30000)});
test('invalid legacy counts and capacity overflow are rejected',()=>{for(const infants of [-1,.5,'invalid',Infinity])assert.throws(()=>priceQuote(config,{adults:2,infants}));assert.throws(()=>priceQuote(config,{adults:99,infants:1}))});

const {validatePickupTimes,selectedPickup,pickupLabel}=await import(pathToFileURL(path.join(dir,'pickup-times.mjs')));
test('pickup schedule validates and orders times',()=>{assert.deepEqual(validatePickupTimes(['10:00','09:00']),['09:00','10:00']);for(const t of [['25:00'],['09:00','09:00'],['9am'],'09:00'])assert.throws(()=>validatePickupTimes(t));assert.equal(pickupLabel('00:00'),'12:00 am');assert.equal(pickupLabel('12:30'),'12:30 pm')});
test('bookings require configured times and reject forged selections',()=>{assert.throws(()=>selectedPickup(['09:00'],''));assert.throws(()=>selectedPickup(['09:00'],'10:00'));assert.equal(selectedPickup(['09:00'],'09:00'),'09:00');assert.equal(selectedPickup([],''),'');assert.equal(selectedPickup(['09:00'],'',false),'')});
test('displayed rates exclude extras and honor date tiers and child settings',()=>{const q=priceQuote({...config,overrides:[{date:'2027-05-27',tiers:[{min:1,max:99,price:120,basis:'person'}]}],extras:[{id:'lunch',name:'Lunch',mode:'group',price:30,required:true}]},{date:'2027-05-27',adults:2,children:1});assert.equal(q.adultUnit,12000);assert.equal(q.childUnit,5000);assert.equal(q.baseTotal,29000);assert.equal(q.total,32000);const group=priceQuote({...config,tiers:[{min:1,max:99,price:300,basis:'group'}]},{adults:2,children:1});assert.equal(group.adultUnit,null);assert.equal(group.childUnit,null);assert.equal(group.baseTotal,30000)});

test('party-size tiers and free children display the charged rate',()=>{const c={tiers:[{min:1,max:2,price:100},{min:3,max:99,price:80}],childPrice:0};const q=priceQuote(c,{adults:2,children:1});assert.equal(q.adultUnit,8000);assert.equal(q.childUnit,0);assert.equal(q.total,16000);assert.equal(priceQuote(c,{adults:2}).adultUnit,10000)});
