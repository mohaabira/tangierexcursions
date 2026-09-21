# Private preview refinement

Live WordPress and its domain/DNS remain untouched. This change updates only the existing private Sites test project.

## Admin diagnosis and repair
The hosted preview had all four D1 tables and a stored private owner identity. No error-level Worker logs were returned during diagnosis. The exact browser symptom reported by the user could not be reproduced: the cloud browser repeatedly timed out while connecting to the local preview. Therefore no definitive hosted runtime root cause is claimed.

Repaired fragile client-only initialization by supplying authenticated identity during server rendering. Added explicit sign-in, forbidden, loading, error, retry and success states. Replaced the limited prototype tabs with a persistent sidebar and connected content, media, pricing, availability, customer, enquiry, review, role, integration and test-email operations.

## Implemented
- Self-hosted subsetted Rubik; transparent/sticky header and dark logo treatment.
- Discovery homepage with real city/duration filtering, curated native-scroll carousels and desktop edge controls.
- Mobile carousel sizing approximates one full card plus 30% of the next; mobile menus and booking bottom sheets.
- Audited tour content organized into semantic sections, sticky section navigation, FAQs, journey component, preserved gallery and links.
- Compact booking, date calendar, traveler selection, enquiry context and server-authoritative pricing.
- Group/person tiers, child/infant overrides, season/date rules, extras, supplements, deposits and promotional codes.
- Tour/page/blog display editing and draft creation, image selection, authenticated object-storage image uploads.
- Reviews limited to completed bookings, moderation, honest-feedback external links, safe event outbox and explicit reminder simulations.
- Staff role settings never alter the private hosting audience.
- Reviewed translation architecture and separate language sitemap; no unreviewed translated routes are published.
- Recently viewed requires optional local-history consent. Wishlist has immediate feedback and authenticated synchronization.

## Validation
Run `tests/pricing.test.mjs`, `tests/preview-owner.mjs` and `tests/refinement.mjs` against the final compiled Worker. The refinement suite checks all 72 original rendered routes, titles and canonical URLs as well as pricing, permissions, content persistence, draft gating, uploads and review events. Runtime data in these tests is disposable local data, never live customer data.

## Limits requiring further review
- Full French/Spanish editorial translations are not supplied. Partial interface translation is clearly disclosed; reviewed per-page translations remain supported.
- Browser visual, mobile-device and accessibility interaction checks remain unverified because the cloud browser connection timed out. CSS/markup inspection does not substitute for those tests.
- Advanced season/date-rule editors currently accept validated JSON; they are functional but would benefit from dedicated calendar controls.
- Test payment and email outbox remain intentional. No payment provider, external email delivery, scheduled background reminders or external review-site conversion tracking is active.
- The editor preserves original audited content and adds an editorial introduction; it is not a full rich-text replacement for WordPress/Elementor.
- The uploaded refinement brief ends midway through the admin Content navigation list.

Final validation: build and TypeScript check passed; 29 compiled Worker workflow checks, 4 private-owner checks, and 7 pricing/source-audit checks passed (40 total). All 72 audited routes rendered successfully with preserved title and canonical values.
