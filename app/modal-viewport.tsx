'use client';
import {useEffect} from 'react';
/** Keyboard-aware bounds shared by every portalled dialog. No input-state rerenders. */
export default function ModalViewport(){
 useEffect(()=>{
  const viewport=window.visualViewport,root=document.documentElement;
  let frame=0;
  const update=()=>{cancelAnimationFrame(frame);frame=requestAnimationFrame(()=>{
   // Preserve browser pinch zoom; don't chase its viewport with the dialog.
   if(viewport&&Math.abs(viewport.scale-1)>.01)return;
   root.style.setProperty('--modal-visible-height',`${viewport?.height||window.innerHeight}px`);
   root.style.setProperty('--modal-visible-top',`${viewport?.offsetTop||0}px`);
  })};
  update();viewport?.addEventListener('resize',update);viewport?.addEventListener('scroll',update);window.addEventListener('resize',update);
  return()=>{cancelAnimationFrame(frame);viewport?.removeEventListener('resize',update);viewport?.removeEventListener('scroll',update);window.removeEventListener('resize',update);root.style.removeProperty('--modal-visible-height');root.style.removeProperty('--modal-visible-top')};
 },[]);
 return null;
}
