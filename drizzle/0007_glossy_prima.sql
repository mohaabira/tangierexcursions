CREATE INDEX `bookings_created_status` ON `bookings` (`created`,`status`);--> statement-breakpoint
CREATE INDEX `records_kind_created` ON `records` (`kind`,`created`);