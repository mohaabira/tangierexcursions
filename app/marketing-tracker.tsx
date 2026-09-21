'use client';
import {useEffect} from 'react';
import {trackEvent,syncAnalyticsConsent} from '@/lib/marketing-client';
export default function MarketingTracker({path,kind,destination,landing}:any){useEffect(()=>{const page=()=>trackEvent(path==='/'?'view_home':destination?'view_destination':landing?'view_landing_page':kind==='tour'?'view_trip':kind==='article'?'view_article':'view_page',kind==='tour'?{trip_id:path}:destination?{destination_id:path}:landing?{landing_page_id:path}:{});page();const consent=()=>{syncAnalyticsConsent();page()};window.addEventListener('te-consent-change',consent);return()=>window.removeEventListener('te-consent-change',consent)},[path]);return null;}
