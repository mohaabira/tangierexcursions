CREATE TABLE `customer_auth_limits` (
	`id` text PRIMARY KEY NOT NULL,
	`attempts` integer NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE INDEX `customer_auth_limits_expiry` ON `customer_auth_limits` (`expires`);--> statement-breakpoint
CREATE TABLE `customer_auth_sessions` (
	`token_hash` text PRIMARY KEY NOT NULL,
	`owner` text NOT NULL,
	`email` text NOT NULL,
	`name` text NOT NULL,
	`expires` integer NOT NULL
);
--> statement-breakpoint
CREATE INDEX `customer_auth_sessions_owner` ON `customer_auth_sessions` (`owner`);--> statement-breakpoint
CREATE INDEX `customer_auth_sessions_expiry` ON `customer_auth_sessions` (`expires`);