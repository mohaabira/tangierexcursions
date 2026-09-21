-- Preserve the current homepage configuration before hiding the additional origin carousel.
INSERT OR IGNORE INTO settings (key,value)
SELECT 'discovery-config-before-compact-layout',value FROM settings WHERE key='discovery-config';
--> statement-breakpoint
UPDATE settings SET value=json_set(value,'$.sections',json((
 SELECT json_group_array(json(CASE WHEN json_extract(section.value,'$.kind')='origin'
 THEN json_set(section.value,'$.enabled',json('false')) ELSE section.value END))
 FROM json_each(settings.value,'$.sections') AS section
))) WHERE key='discovery-config';
