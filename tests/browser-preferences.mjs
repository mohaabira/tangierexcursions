import test from 'node:test';import assert from 'node:assert/strict';
import fs from 'node:fs';import ts from 'typescript';
const code=ts.transpileModule(fs.readFileSync(new URL('../lib/browser-preferences.ts',import.meta.url),'utf8'),{compilerOptions:{module:ts.ModuleKind.ESNext,target:ts.ScriptTarget.ES2022}}).outputText;
const {readPreference,writePreference,readWishlist}=await import('data:text/javascript;base64,'+Buffer.from(code).toString('base64'));
const storage=value=>Object.defineProperty(globalThis,'localStorage',{configurable:true,value});
test('blocked browser storage does not throw or prevent fallback',()=>{Object.defineProperty(globalThis,'localStorage',{configurable:true,get(){throw new Error('Storage denied')}});assert.equal(readPreference('te-language','en'),'en');assert.doesNotThrow(()=>writePreference('te-language','fr'));assert.deepEqual(readWishlist(),[])});
test('malformed and incorrectly shaped wishlist data recover safely',()=>{for(const value of ['{broken','null','42','{"path":"/tour/"}']){storage({getItem:()=>value});assert.deepEqual(readWishlist(),[])}});
test('saved wishlist preserves valid paths and removes invalid entries',()=>{storage({getItem:()=>JSON.stringify(['/tour/',null,42,'/tour/','//other.example','/second/'])});assert.deepEqual(readWishlist(),['/tour/','/second/'])});
test('storage quota failure keeps actions usable',()=>{storage({setItem(){throw new Error('Quota exceeded')},getItem:()=> 'EUR'});assert.doesNotThrow(()=>writePreference('te-currency','MAD'));assert.equal(readPreference('te-currency'),'EUR')});
