# Organic discovery — Phase 2

## Audit and implementation plan

Phase 1 provides `seo:<path>` profiles, `contentRegistry`, page-backed landing CMS, `marketing:relationships`, discovery terms/links, staff permissions, analytics and attribution. Reuse these unchanged in identity; do not create parallel SEO tables or a second dashboard.

Extend the existing SEO workspace, resolver, sitemaps, redirects, 404 records, editorial panel, page records, reusable Golden information and media metadata. New functionality comprises Knowledge article fields, editorial review metadata, topic hubs, durable audit results, bounded audit jobs and migration review imports. Booking, payment, identity, analytics consent/IDs/attribution and existing public design remain untouched.

The preview remains globally noindex and robots-blocked. Production indexing requires explicit deployment configuration; editorial eligibility alone never makes staging public.

## Canonical and indexing rules
`lib/organic-core.ts` is the shared pure policy. HTTPS apex aliases normalize to `www`, fragments and all query parameters are excluded from canonicals, and existing trailing-slash content URLs remain preferred. The framework now uses `trailingSlash: true`, aligning responses with the established WordPress paths. Campaign parameters are not removed from the browser before Phase 1 attribution; redirects carry the supported UTM values to the destination.

Protected routes, drafts, internal search and faceted query pages are noindex. `SEO_PUBLIC_INDEXING=true` is required together with the real Tangier Excursions hostname to enable public metadata indexing or production robots rules. The preview remains private/noindex. Deployment must separately configure this flag when the WordPress migration is approved. Do not enable it on preview hosts.

## Content and editorial control
Knowledge records extend `page:/knowledge/<slug>/`; they are not blog entries in the journal listing. Fields include a direct answer, detailed HTML, category, destination/departure/tour/question relationships, approved author/reviewer attribution, review date, references, shared fact IDs and schema eligibility. Publishing requires a substantive answer and named factual review. No articles, operational claims or advice are seeded automatically. The `/knowledge/` directory becomes available when the first article is published.

Landing pages continue using Phase 1 `page:<path>` records. The existing rich-text editor supplies sections. Indexing requires the readiness gate: original introduction, useful text, related tours/destinations, useful FAQs, internal links, described image, metadata, self canonical and no obvious near-duplicate. These are editorial screening rules, not proof of content quality or a numeric SEO score. Existing indexed pages also run the gate when edited. Generic page editing is blocked for these structured content types to prevent deleting their fields.

## Shared traveler facts
`golden-shared.blocks` remains the source of reusable factual information. Its existing editor now exposes a fact key, source URL and last-reviewed date. Tours reference `reusableIds`; Knowledge and landing content reference `factIds` and resolve the current source at render time. Deletion checks include all these references. Existing tour pricing, pickup, deposit and cancellation models remain authoritative; do not copy those values into a second factual database. Existing booking/pre-trip workflows remain unchanged; factual snapshots already sent to guests are not retroactively rewritten.

## Relationships and hubs
`marketing:relationships` is extended with relationship type, module label and explicit `publish`. Suggestions use existing taxonomy IDs and reviewed relationships, not keyword-generated guesses. Up to six approved visible links are rendered as normal HTML anchors. Unapproved relationships never insert editorial links. Review metadata can designate topic, destination, departure or experience hubs without changing URLs.

Potential orphans are based on contextual/editorial incoming links; site-wide navigation is deliberately not counted. The architecture view exposes both directions, taxonomy and indexing state. Opportunities use internal content relationships only; no ranking, external-link or AI-citation data is invented.

## Schemas and company identity
`contentSchemas` remains the central output path. It preserves descriptive migrated schema and adds applicable WebPage, Article, Trip, TouristDestination, WebSite, Organization, visible FAQs and breadcrumbs. Company fields come from the existing company settings. Legacy review/rating/offer claims are suppressed rather than assuming they match current visible data. No replacement ratings, availability or prices are fabricated. FAQ markup is regenerated from visible answer sources. Schema inspection uses the same generator and reports source parsing/structural errors; it is not external validation or a rich-results guarantee.

Google references consulted: https://developers.google.com/search/docs/appearance/structured-data/sd-policies and https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data . FAQ content remains useful; no Google FAQ rich-result eligibility is claimed (see https://developers.google.com/search/updates).

## Sitemaps and robots
The existing sitemap index now separates tours, destinations, landing pages, knowledge, blog and static pages. All use the same registry/indexability policy. New content gets persistent creation/update dates; only recorded modification dates are emitted. Drafts, aliases, private pages, noindex entries and redirected sources are excluded. Robots is inspectable; global blocking rules cannot accidentally be changed in a freeform admin editor.

## Redirects, 404s and migration
`seo:redirects` remains the only rules store. Middleware executes 301/302/410, enforces safe local destinations, preserves campaign attribution and records aggregate usage separately. Save validation rejects duplicate sources, private routes, self redirects, loops, chains and unpublished/unrecognized destinations. Existing invalid rules fail safely at runtime.

404 records aggregate by sanitized public path. New records never contain raw query strings, IP addresses or raw user agents; only an optional referrer hostname and bot/noise classification are retained. The monitor supports ignoring noise and directly preparing a reviewed redirect.

CSV imports use Old URL, New URL, Action, Notes. Imports are review records only. Apply is deliberate per mapping, supporting Keep unchanged, 301 redirect, 410 retire and Review. No blanket redirect policy is applied.

## Audit workflow and performance
Audit jobs and issues reuse the existing indexed `records` store, with dedicated record kinds. Five pages are processed per authenticated admin request. Cursor checkpoints allow retry/resume; visitor and booking requests do not execute these scans. The admin runs consecutive batches while the audit is open; no unattended scheduler is configured. Rechecking reopens a manually resolved issue if the condition still exists. Issues have stable page/check identities, timestamps, reason, action, severity and workflow state. No arbitrary percentage SEO scores remain.

Content duplication is a bounded five-word-shingle similarity check. Heading checks inspect stored HTML and the known H1 template contract; they are not a substitute for a rendered browser crawl. Internal links are checked against the published inventory. `scripts/audit-media-inventory.py` refreshes image dimensions, formats and file sizes from local public assets; rerun after replacing bundled media. Uploaded media uses the existing records and bounded R2 existence checks during audits. Unknown dimensions or external references are not reported as verified. Existing responsive image variants and hero playback safeguards are preserved; this phase does not transcode every legacy image.

`web_vital` extends the existing consented Phase 1 event allowlist. It reuses visitor/session/environment controls, event storage and retention. LCP/CLS use supported browser performance entries; INP is a native Event Timing estimate, not CrUX-certified data. The workspace shows 28-day p75 by template/environment and sample count, bounded to the latest 10,000 samples. Unsupported/unobserved metrics remain absent. Checkout/private routes remain excluded from optional analytics; booking performance needs separate synthetic measurement. No external analytics/search/advertising integrations are activated.

## Tests and operational boundaries
Pure tests cover canonical normalization, private/search/facet rules, sitemap policy, redirect graph validation, migration CSV safety, quality gating, similarity, graph/orphan behavior, taxonomy suggestions and freshness. Worker integration tests use isolated databases and exercise Knowledge draft/publication/rendering, generated schema, split sitemaps, reviewed visible links, real redirect responses, 404 aggregation/privacy, migration review/apply, audit jobs and issue status. Phase 1 regression fixtures now explicitly test rejection of thin indexable landing content and use its dedicated sitemap.

Browser preview connectivity timed out in this session. Mobile interaction, visual layout and real-device checks remain unverified. No production WordPress records, real bookings, payments or external messages are modified by these tests. This is a private-development deployment, not approval to migrate the live domain.

### Session verification results
- Production build and TypeScript validation passed.
- Pure organic-discovery and Phase 1 marketing rule suites passed.
- Isolated Worker Phase 2 integration suite passed, including actual 301/410 behavior and publication checks.
- Phase 1 marketing integration, pickup/pricing, unified booking/checkout, customer authentication, login settings and travel-hub/destination suites passed.
- Master tour audit passed rendering and structured editor save/reload for all 40 published products, with pricing/deposit and authorization checks.
- OAuth callback tests now follow the deliberate trailing-slash normalization while verifying that query parameters and the secure callback flow are preserved.
- Desktop/mobile browser QA remains blocked by preview connection timeouts. Do not treat this as completed visual acceptance or a measured production performance certification.
