'use client';
import {useEffect,useRef,useState} from 'react';
import {Play,Pause} from 'lucide-react';

const base='/assets/hero/tangier-journey-';
export function HeroBackground(){
 const video=useRef<HTMLVideoElement>(null),image=useRef<HTMLImageElement>(null);
 const [source,setSource]=useState(''),[playing,setPlaying]=useState(false);
 const pausedByUser=useRef(false);
 const [paused,setPaused]=useState(false);
 useEffect(()=>{
  const motion=window.matchMedia('(prefers-reduced-motion: reduce)');
  const mobile=window.matchMedia('(max-width: 767px)');
  const large=window.matchMedia('(min-width: 1280px) and (min-resolution: 1.5dppx), (min-width: 2561px)');
  const connection=(navigator as any).connection;
  let disposed=false,timer:ReturnType<typeof setTimeout>|undefined;
  const choose=()=>{
   clearTimeout(timer);setPlaying(false);
   video.current?.pause();
   setSource('');
   if(disposed||motion.matches||connection?.saveData||['slow-2g','2g','3g'].includes(connection?.effectiveType))return;
   // Allow the poster, text, fonts and initial UI to render before requesting video.
   timer=setTimeout(()=>{if(!disposed)setSource(base+(mobile.matches?'mobile':large.matches?'4k':'desktop')+'.mp4')},250);
  };
  const ready=()=>{if(document.readyState==='complete')choose()};
  if(document.readyState==='complete')choose();else window.addEventListener('load',ready,{once:true});
  motion.addEventListener('change',choose);mobile.addEventListener('change',choose);large.addEventListener('change',choose);connection?.addEventListener?.('change',choose);
  return()=>{disposed=true;clearTimeout(timer);window.removeEventListener('load',ready);motion.removeEventListener('change',choose);mobile.removeEventListener('change',choose);large.removeEventListener('change',choose);connection?.removeEventListener?.('change',choose)};
 },[]);
 useEffect(()=>{
  const el=video.current;if(!el||!source)return;
  el.muted=true;
  const play=()=>{if(!pausedByUser.current)el.play().catch(()=>setPaused(true))};
  const observer=new IntersectionObserver(([entry])=>{if(entry.isIntersecting&&!document.hidden)play();else el.pause()},{threshold:0});
  observer.observe(el);
  const visibility=()=>{if(document.hidden)el.pause();else{const rect=el.getBoundingClientRect();if(rect.bottom>0&&rect.top<window.innerHeight)play()}};
  document.addEventListener('visibilitychange',visibility);
  return()=>{observer.disconnect();document.removeEventListener('visibilitychange',visibility);el.pause()};
 },[source]);
 function toggle(){const el=video.current;if(!el)return;if(el.paused){pausedByUser.current=false;el.play().catch(()=>setPaused(true))}else{pausedByUser.current=true;el.pause()}}
 return <><div className="hero-background" aria-hidden="true">
  <picture><source media="(max-width: 767px)" srcSet={base+'poster-mobile.jpg'}/><img ref={image} className="hero-poster" src={base+'poster.jpg'} width="2560" height="1440" alt="" fetchPriority="high" loading="eager"/></picture>
  {source&&<video key={source} ref={video} className={'hero-film'+(playing?' is-playing':'')} src={source} poster={base+(source.includes('mobile')?'poster-mobile.jpg':'poster.jpg')} autoPlay={!pausedByUser.current} muted loop playsInline preload="metadata" aria-hidden="true" tabIndex={-1} disablePictureInPicture onPlaying={()=>{setPlaying(true);setPaused(false)}} onPause={()=>setPaused(true)} onError={()=>{setPlaying(false);setSource('')}}/>}
 </div>{source&&<button className="hero-playback" onClick={toggle} aria-label={paused?'Play background video':'Pause background video'} title={paused?'Play video':'Pause video'}>{paused?<Play size={17} fill="currentColor"/>:<Pause size={17} fill="currentColor"/>}</button>}</>
}
