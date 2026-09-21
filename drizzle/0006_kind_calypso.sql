CREATE TABLE `marketing_conversions` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`target` text NOT NULL,
	`environment` text NOT NULL,
	`visitor` text,
	`session` text,
	`first_touch` text,
	`last_touch` text,
	`path` text,
	`created` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `marketing_conversion_env_date` ON `marketing_conversions` (`environment`,`created`);--> statement-breakpoint
CREATE UNIQUE INDEX `marketing_conversion_target` ON `marketing_conversions` (`kind`,`target`);--> statement-breakpoint
CREATE INDEX `marketing_conversion_expiry` ON `marketing_conversions` (`created`);--> statement-breakpoint
CREATE TABLE `marketing_events` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`created` text NOT NULL,
	`environment` text NOT NULL,
	`visitor` text,
	`session` text,
	`path` text,
	`booking` text,
	`context` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `marketing_events_env_date` ON `marketing_events` (`environment`,`created`);--> statement-breakpoint
CREATE INDEX `marketing_events_session_date` ON `marketing_events` (`session`,`created`);--> statement-breakpoint
CREATE TABLE `marketing_sessions` (
	`id` text PRIMARY KEY NOT NULL,
	`visitor` text NOT NULL,
	`environment` text NOT NULL,
	`created` text NOT NULL,
	`last_seen` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `marketing_sessions_expiry` ON `marketing_sessions` (`last_seen`);--> statement-breakpoint
CREATE INDEX `marketing_sessions_visitor` ON `marketing_sessions` (`visitor`);--> statement-breakpoint
CREATE TABLE `marketing_visitors` (
	`id` text PRIMARY KEY NOT NULL,
	`environment` text NOT NULL,
	`first_touch` text,
	`last_touch` text,
	`created` text NOT NULL,
	`last_seen` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `marketing_visitors_expiry` ON `marketing_visitors` (`last_seen`);