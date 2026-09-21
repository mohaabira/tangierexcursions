# Approved Golden template rollout — private staging

The latest supplied brief approves the Tarifa reference design for the full catalogue. The rollout uses one shared component and separately editable structured records for 40 audited tours. It does not modify the public business website.

## Preserved assets

`data/catalog.json`, the audited structured-tour baseline, original URLs, source HTML, metadata, canonical values, source schema, media files and existing media URLs are retained. Deterministic preparation scripts write new derived records. Original HTML is available in the migration comparison view, and is not rendered a second time beneath structured tour content.

Unknown cancellation terms, geographic coordinates and accommodation details are not manufactured. Newly mapped records remain REVIEW REQUIRED until the business reviews their migration decisions. Approving the design is distinct from approving conflicting source facts. Imported guest reviews retain their wording and are never marked as verified bookings.

## Functional additions

- Reusable tour presentation for day trips, circuits and packages; optional sections can be reordered or hidden.
- Time-based, sequential and day-based itinerary items, with timed events nested within days; accommodation, meals, distance and driving-time fields.
- Persistent admin editors, draft duplication, source comparison and existing SEO protections.
- Searchable travel journal, category filters and featured-story ordering, article table of contents, reading progress, optional factual quick answers and contextual tour relationships.
- About, landing, legal, contact-request and not-found presentation; listing filters retain the established landing URL.
- Shared header/footer language and currency controls; icon-only social links; compact mobile accordions. Account prices show the selected planning currency and explicitly retain EUR settlement.
- Anonymous guide-helpfulness aggregates only after the visitor clicks a clearly explained feedback action. No identity, IP address or free-form query is saved by this feature.

Admin journal/page presentation changes use the existing durable database settings and are audit logged. Production payments and live email remain disconnected. The previously implemented review-request outbox and templates are retained.

## QA evidence

See the committed test results. Server-rendered routes, protected metadata, admin persistence, nested events, structured draft duplication and deletion, booking quotes and booking/enquiry recording are covered by local Worker/database integration tests. Browser/device visual verification must be reported separately and must not be inferred from these tests.

Browser QA limitation: the supervised preview starts, but browser navigation timed out and reset the browser connection. No device-level visual or interaction pass is claimed for this revision.
