# Growth & Marketing Engine — Phase 1

## Audit / implementation plan (before implementation)
- Existing: React 19/Vinext server rendering on Cloudflare Worker; D1 SQLite and R2; prepared SQL; settings-backed editorial/tour/destination CMS; records-backed leads, reviews, partners, suppliers, payment ledger and durable booking events; dedicated bookings table. ChatGPT identity and customer email/OAuth sessions; operation-based staff permissions.
- Existing SEO: per-page seo settings, migrated metadata and JSON-LD, SEO editor, redirects, split XML sitemaps, editorial internal links. Preserve all of these and manual overrides. Existing SEO heuristic scores are not reliable measurements and will not be used by the foundation dashboard.
- Existing analytics: consented discovery events in generic records, browser opt-in te-analytics, optional local planning history. No acquisition/session model or booking attribution. Payments are explicitly simulations; production revenue must not count them.
- Incomplete: registry/sitemaps currently call a heavy audit; canonical alias filtering; deterministic health checks; analytics permission granularity; consent revocation integration.
- Missing: dedicated indexed visitor/session/event/conversion tables; first/last touch; privacy-filtered contextual event API; backend conversion bridge; retention; environment partition; landing CMS; date-filtered reporting.
- Modify: shared API helper, privacy controls, existing booking-event dispatcher, lead persistence, SEO resolver/sitemap, editorial page inventory, existing admin navigation/permissions.
- Add: marketing core/server/client services, derived content registry, landing editor using existing page/SEO records, marketing workspace, additive Drizzle migration, automated integration tests. No external providers or scripts.

## Architecture
Optional events flow through marketing-client → /api/marketing-event → marketing service. Business conversions attach an immutable snapshot to the booking/lead using an isolated helper. Trusted booking events are translated from the existing durable backend event ledger with stable IDs. Booking/payment records remain authoritative and are never deleted by analytics retention.

Analytics requires explicit version-2 site analytics opt-in plus enabled internal tracking. Previous discovery-only consent triggers a renewed choice and does not silently authorize expanded attribution. Consent is mirrored to a same-origin HTTP-only cookie; identifiers are HTTP-only random UUIDs and only created after opt-in. Revocation clears cookies and local discovery IDs. No IP, raw query string, user agent, search text, messages, email or passport data is captured. UTM values use a restricted short campaign token alphabet; referrer contains host only and landing URL contains public path only.

Sessions expire after 30 minutes of inactivity. First-touch is inserted once per retained visitor. Last-touch updates on a new external/UTM acquisition (direct navigation does not overwrite an earlier campaign). Acquisition snapshots at conversion do not change when later traffic changes. Browser consent withdrawal prevents later optional events and new attribution snapshots; retained historical records expire through retention.

Environments come from server MARKETING_ENVIRONMENT (production only by explicit deployment configuration); fallback is development locally or staging when hosted. Nonproduction browser tracking requires debugTracking. Existing simulated bookings/payments always report as staging, even on a production server. Production metrics exclude simulations. Leads store their server environment; legacy leads without an environment are treated as staging.

Event names are declared in lib/marketing-core.ts. Only client event names are accepted publicly; deposit_paid, booking_confirmed, booking_cancelled and refund_completed come from backend state changes. Event context is allowlisted. Future adapters consume this schema and stable IDs after separate consent/purpose checks; no adapter is enabled here.

SEO uses existing seo:<path> records and migrated page fields. Manual nonempty values win; empty fields fall back to content data. The URL registry is derived, never a second content database. Sitemaps resolve the same published metadata fallback as public rendering and include only published, canonical-self, indexable public entries, excluding redirects and system routes. This private preview remains globally noindex.

Landing pages reuse page:<path> with a landing content object, and the existing SEO profile; new records are draft/noindex. Publishing and enabling indexing are separate deliberate actions. URLs are fixed after creation. Relationships combine known editorial links, landing associations, existing discovery taxonomy (departure cities, types, activities and destinations), and reviewed records; suggestions never edit content.

Reporting uses indexed environment/date event queries and booking/lead conversion snapshots; distinct sessions define funnel counts. Revenue is booked value (current noncancelled confirmed/completed booking total in settlement EUR), not paid or recognized revenue. Test values are clearly isolated. Missing denominators show no data; linked lead-to-booking reporting only uses explicit lead references, never guessed identity matching.

Retention defaults to 90 days. A daily opportunistic sweep on consented event ingestion and admin maintenance delete bounded batches of expired events, sessions and visitors, then conversion attribution; operational records remain intact. A future scheduled worker can call the same maintenance service. For high volumes or inactive sites, run maintenance regularly until a scheduled worker is connected. At greater volume introduce daily aggregates behind reporting service, with environment/date keys and idempotent rollups.

Permissions: view_marketing, view_analytics, manage_seo, manage_landing_pages, manage_tracking map to existing admin/content/seo/finance roles. Responses expose aggregate metrics and public content, not customer records.

## Validation and operating boundaries
- Automated worker integration tests exercise cookie consent, debug gating, campaign snapshots, sessions, lead/contact/booking attribution, backend payment/refund/cancellation deduplication, draft publication, SEO manual values, rendered landing content, sitemap, permissions, retention and missing analytics tables.
- Existing booking pickup/pricing and customer authentication regression suites run separately.
- Data reports are bounded to one year, 200 content rows and 10,000 conversions per query; a visible warning asks for a narrower range if conversion limits are reached. Tables paginate 25 rows. Engaged sessions are intentionally unmeasured, not inferred.
- Revenue dimensions for tour/destination/departure city use current catalog taxonomy; first/last acquisition snapshots remain immutable. No currency mixing: booked totals use existing EUR minor units. Operational ledger totals and attributed totals are labeled separately.
- Backend event delivery has a separate marketingDelivered marker; retrying existing booking event dispatch retries failed analytics writes without repeating successful operational delivery. Stable event IDs deduplicate successes.
- This deployment does not enable external scripts, API keys, payment collection, advertising, AI generation or email campaigns. Existing SEO editor tools are preserved, except misleading heuristic score displays were removed.
- Rollback: redeploy previous application version; additive tables and indexes can remain safely. Do not drop analytics data as an automatic downgrade. Migrations are additive and do not remove operational fields.
- Server configuration: MARKETING_ENVIRONMENT=production must be explicit at the real production launch. Default hosted environment is staging. debugTracking is disabled by default; enable it only to collect separated preview activity.
- Browser preview validation was blocked by the session browser (ERR_BLOCKED_BY_CLIENT); automated worker rendering and integration tests are the available verification evidence.
