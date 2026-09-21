# Golden Tour review — Tarifa demonstration only

Existing route: `/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/`.

This is a private staging demonstration, not approval for a production release or a wider migration. All other tours retain their previous rendering system.

## Source and preservation

The immutable audited `data/catalog.json` and original migration snapshots are retained. `scripts/migration/golden-tour.py` deterministically maps only the Tarifa day tour into `data/golden-tour.json`. Migration 0003 seeds the structured record without overwriting later Admin edits. Original title, URL, canonical, source metadata, schema and media files are unchanged.

The Golden frontend renders structured paragraphs, linked text, repeatable highlights, seven itinerary stops, inclusions, exclusions, optional arrangements, practical information, FAQs and the four published source reviews. Legacy page HTML is not rendered beneath the template and is excluded from its public client payload. It remains available in the authenticated comparison view.

## Management

- Admin → Tours → edit the Tarifa experience: General, Content, Itinerary, Gallery, Pricing, Availability, Booking, Location & Map, FAQs, Related, SEO and Translations.
- Admin → Tour Content Review: original-versus-structured comparison, source-word/link coverage flags, decision notes and single-tour approval.
- Admin → Reusable Information: global cancellation policy, reusable practical information and global/destination FAQ records, individually assigned to the tour.
- Admin → Maps: OpenStreetMap street tiles or route diagram, zoom and selection animation. This provider needs no API credential. The map provider adapter is isolated from tour data; additional authenticated providers would require a server-side adapter.

Save operations persist in the staging database and preserve previous values in the Admin log. Approval does not enable any other tour. Any subsequent source content save returns the Golden Tour to REVIEW REQUIRED.

The coverage check compares words and links within each corresponding field. It is a review aid, not a semantic guarantee. An administrator must document uncertain mappings and possible losses before approval.

## Factual gaps that require business review

1. Cancellation: the tour contains no cancellation policy, and the audited Terms page is placeholder content. No free-cancellation promise was invented. A reviewed business policy is required before approval.
2. Ferry tickets, camel ride, lunch/drinks and extra time are explicitly optional in this source. They remain separate from included services.
3. Timing: no precise stop times are supplied. The demonstration uses sequential stops, with time/day modes available in Admin.
4. Map: proposed coordinates describe approximate attraction areas, not verified meeting points. Lines connect stops, not routed roads/ferry navigation. This is not live tracking. Coordinates require review.
5. FAQs: original distance/customs wording is retained and flagged for factual review rather than silently rewritten.
6. Reviews: four published source reviews are preserved. Individual star scores and booking verification were not present in the supplied content, so they are not invented. The independently preserved aggregate rating is displayed separately. New moderated booking reviews can show their recorded rating and verification.

## Validation

TypeScript and the final production build passed. All 27 compiled-Worker checks passed: 20 content/migration/booking/preservation checks, five gallery/itinerary-media checks and two moderated-review checks. This includes fresh authenticated reads after writes, deletion protection, source comparison flags, inherited content, translation persistence, the approval gate, authoritative pricing, saved bookings/enquiries and all 72 original routes/titles/canonicals. Results are recorded in the three golden-*-test-results.json files. git diff --check passed. Browser navigation and screenshot capture both timed out in the supported preview browser. No desktop/mobile visual pass, touch/swipe pass, map tile loading pass or browser interaction pass is claimed. Therefore the Golden Template is not considered ready for wider migration.

Map tile configuration follows https://operations.osmfoundation.org/policies/tiles/ with explicit loading, direct browser requests and visible attribution; no offline fetching or bulk tile download.
