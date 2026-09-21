CREATE TABLE `bookings` (
	`id` text PRIMARY KEY NOT NULL,
	`owner` text NOT NULL,
	`tour` text NOT NULL,
	`date` text NOT NULL,
	`guests` integer NOT NULL,
	`total` integer NOT NULL,
	`status` text NOT NULL,
	`token` text NOT NULL,
	`data` text NOT NULL,
	`created` text NOT NULL,
	`request_key` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `bookings_owner` ON `bookings` (`owner`);--> statement-breakpoint
CREATE UNIQUE INDEX `bookings_token` ON `bookings` (`token`);--> statement-breakpoint
CREATE UNIQUE INDEX `bookings_request` ON `bookings` (`owner`,`request_key`);--> statement-breakpoint
CREATE TABLE `records` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`owner` text NOT NULL,
	`data` text NOT NULL,
	`created` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `records_kind_owner` ON `records` (`kind`,`owner`);--> statement-breakpoint
CREATE TABLE `sessions` (
	`token` text PRIMARY KEY NOT NULL,
	`owner` text NOT NULL,
	`role` text NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE `settings` (
	`key` text PRIMARY KEY NOT NULL,
	`value` text NOT NULL
);
