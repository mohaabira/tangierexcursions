# Review & Reputation Engine — private staging

This implementation changes the separate owner-private Sites preview only. It does not connect to or modify TangierExcursions.com, send real customer emails, charge payments, scrape review services, or submit reviews to external platforms.

## Available for testing

- Completed booking → 64-character random review token → secure review page and QR. Existing completed bookings can be enrolled deliberately from Reviews → Review requests.
- Default first request after 10 hours; one reminder after 72 hours. Configurable limits, persisted opt-out/completion and at-least-24-hour manual resend protection. Atomic/idempotent test outbox insertion prevents duplicate requests during concurrent processing.
- English, French and Spanish review pages and editable localized email templates. Booking language is captured and admin-editable.
- Explicit text/photo publication consent, rating selection without a preselected positive rating, display-name privacy validation, completed-booking validation and duplicate submission protection.
- Guest photos are client-resized, orientation-corrected and converted to WebP where supported, with a 480px derivative and a 1600px main image. Server checks type, signature, size and booking ownership. Pending media stays private; deletion removes stored media and public access.
- Persistent moderation reasons/history, official public response, optional response test notification, low-rating internal attention with assignee/notes/contact-action/resolution. Attention does not affect external review choices.
- Reviews workspace: Overview, All reviews, Pending moderation, Published, Needs attention, Photo reviews, Review requests, Platform settings, Automation, Analytics.
- Cohort filters by travel date, experience, destination, guide, country, booking language and source. Unique page visits and platform clicks; actual first-party counts and averages. Delivery/open metrics are explicitly unavailable.
- Admin-configured official Google, Tripadvisor and Trustpilot URLs. Every eligible guest sees the same enabled destinations regardless of rating. No automatic cross-posting. External publication status remains unknown.
- Server-rendered reviews on the appropriate tour, homepage, existing review archive and admin-associated existing landing pages. No new indexable taxonomy/review archives, no invented AggregateRating, and no rewrite of migrated schema.
- Account/voucher secure review QR and status; post-tour request email QR. The existing staff voucher-verification QR remains separate.
- Templates: initial request, reminder, thank-you, photo thank-you, internal attention alert, admin notification and public response notification, using the new logo and company details.

## Deliberately unconnected / not production-ready

- The private preview uses a test outbox. Messages labelled queued have not been sent. Delivery/open metrics cannot be measured until a real provider and approved event integration exist.
- There is no unattended cloud scheduler connected in the available Sites interface. The due-request processor runs through the authenticated admin action. Saved delay/reminder rules are implemented and tested, but unattended sending is not claimed.
- Trustpilot invitation API credentials, authorized transaction invitations and TrustBox widgets are not connected. Business/widget identifiers and neutral official links can be saved without exposing secrets; no integration status is fabricated. Tripadvisor API/widgets are also not connected.
- Additional review languages beyond EN/FR/ES require a future language-pack extension; those are the only enabled review languages in this preview.
- Browser navigation/snapshot attempts timed out in the managed preview browser. Device-level visual verification and real guest-device upload interaction remain pending. Server-rendering, ownership, moderation, data persistence and workflow behavior are tested independently.
- The review engine remains staged for owner review. It is not declared a complete live reputation-automation service.

## Data and privacy

Structured entities use the existing indexed `records` store: review-request, review-token, review, review-photo, review-event and email. Booking foreign relationships are validated against completed booking records. Tokens and internal fields are confined to authorized admin/account and bearer-token flows; the public review projection omits booking identifiers, contact data, internal notes and private staff information. Review pages use noindex/nofollow, no-store and no-referrer. Token expiration is one year and cancelled bookings lose token access.

All original migration source, production routes and existing content assets remain preserved. Only the already-approved Golden Tour uses the structured template; this phase performs no wider tour migration.

## Policy references checked

- Google Business Profile review requests / neutral feedback and no incentives: https://support.google.com/business/answer/3474122?hl=en
- Google review structured-data eligibility and self-serving Organization/LocalBusiness restrictions: https://developers.google.com/search/docs/appearance/structured-data/review-snippet
- Trustpilot neutral invitation practices: https://help.trustpilot.com/s/article/Best-practices-for-creating-review-invitations?language=en_US
- Trustpilot business guidelines: https://corporate.trustpilot.com/legal/for-businesses/guidelines-for-businesses/jun-2026

The official Tripadvisor guidelines page could not be retrieved in this session. No scraping, attribution-dependent republishing, API invitation or widget is implemented; only the administrator's official review destination is supported.

## Validation

`tests/reputation-engine.mjs` exercises 20 workflow/privacy/security/SSR checks using the actual built Worker, isolated D1 and R2. Existing Golden Tour (20), refinement/media/email (10) and search-presence (6) regression checks also pass. Test fixture updates add the newly required review publication consent and legitimate moderation reason.
