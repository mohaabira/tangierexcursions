'use client';
import {useId,useRef,useState} from 'react';
import {CalendarDays,ChevronDown} from 'lucide-react';
import {Dialog,DialogContent,DialogTitle,DialogDescription,DialogTrigger} from '@/components/ui/dialog';
import {Calendar} from '@/components/ui/calendar';
import {Popover,PopoverContent,PopoverTrigger} from '@/components/ui/popover';

export const localDate=(d:Date)=>`${d.getFullYear()}-${String(d.getMonth()+1).padStart(2,'0')}-${String(d.getDate()).padStart(2,'0')}`;
type DateFieldProps={onChange?:(event:{target:{value:string;name?:string};currentTarget:{value:string;name?:string}})=>void;[key:string]:any};
export function DateField({label='Date',value,defaultValue='',onChange,min,max,required=false,disabled=false,name,id,placeholder='Choose a date',className='',calendarPresentation='dialog',...rest}:DateFieldProps){
 const generated=useId(),[open,setOpen]=useState(false),[own,setOwn]=useState(defaultValue),trigger=useRef<HTMLButtonElement>(null);
 const current=value??own,selected=current?new Date(current+'T12:00:00'):undefined,fieldId=id||generated;
 const choose=(v:string)=>{setOwn(v);onChange?.({target:{value:v,name},currentTarget:{value:v,name}});setOpen(false)};
 const start=min?new Date(min+'T12:00:00'):new Date(1900,0,1),end=max?new Date(max+'T12:00:00'):new Date(2100,11,31);
 const today=localDate(new Date()),todayAllowed=(!min||today>=min)&&(!max||today<=max);
 const button=<button type="button" id={fieldId} ref={trigger} className={'date-field-trigger '+(!current?'is-empty':'')} disabled={disabled} aria-labelledby={fieldId+'-label '+fieldId+'-value'} aria-required={required}><span className="date-field-icon"><CalendarDays size={20}/></span><span id={fieldId+'-value'}>{selected&&!isNaN(selected.getTime())?selected.toLocaleDateString('en-GB',{day:'numeric',month:'short',year:'numeric'}):placeholder}</span><ChevronDown size={16}/></button>;
 const calendar=<><Calendar mode="single" captionLayout="dropdown" fixedWeeks selected={selected} defaultMonth={selected||new Date()} startMonth={start} endMonth={end} disabled={d=>(!!min&&localDate(d)<min)||(!!max&&localDate(d)>max)} onSelect={d=>d&&choose(localDate(d))}/><div className="date-field-actions"><div>{todayAllowed&&<button type="button" onClick={()=>choose(today)}>Today</button>}{!required&&current&&<button type="button" onClick={()=>choose('')}>Clear</button>}</div><button type="button" onClick={()=>setOpen(false)}>Close calendar</button></div></>;
 return <div className={'field date-field '+className}><span id={fieldId+'-label'}>{label}{required?' *':''}</span>{calendarPresentation==='dialog'?<Dialog open={open} onOpenChange={setOpen}><DialogTrigger asChild>{button}</DialogTrigger><DialogContent className="date-field-dialog"><DialogTitle>{label}</DialogTitle><DialogDescription>Choose a date. Today is highlighted in gold.</DialogDescription>{calendar}</DialogContent></Dialog>:<Popover open={open} onOpenChange={setOpen}><PopoverTrigger asChild>{button}</PopoverTrigger><PopoverContent className="date-field-popover" align="start" sideOffset={8} collisionPadding={12}><div className="date-field-heading"><strong>{label}</strong><span>{selected&&!isNaN(selected.getTime())?selected.toLocaleDateString('en-GB',{weekday:'long',day:'numeric',month:'long'}):'Choose a day · today is highlighted'}</span></div>{calendar}</PopoverContent></Popover>}<input className="date-field-validation" type="text" name={name} value={current} required={required} disabled={disabled} tabIndex={-1} aria-label={label} onChange={()=>{}} onInvalid={e=>{e.preventDefault();setOpen(true);trigger.current?.focus()}}/></div>
}
