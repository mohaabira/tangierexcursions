# Private staging search and discovery

This update is confined to the existing owner-private Sites staging project. No production WordPress, DNS, external email delivery, live payment, or public audience changes are included.

## Data and SEO preservation

- Baseline: 72 audited pages, 40 tours. `data/catalog.json`, the original audit, source HTML snapshots, media URLs and previously applied migration are unchanged.
- New relational discovery tables hold 48 supported classifications and 453 initial tour relationships. The source evidence and reviewed exclusions are saved in `discovery-inventory-audit.json`. Destination assignment excludes cross-sells, alternate pickup mentions and testimonial-only claims. Multi-day products are excluded from the day-trip facet.
- Existing origin and collection landing pages are reused. No public taxonomy archive is generated. `/search/` and filter combinations are noindex. The whole private preview remains noindex as before; production indexability is not modified.
- Reorganized source content retains every original text token. The per-tour preservation comparison is in `discovery-content-preservation.json`. Original images remain at the original URLs.
- Valid JSON-LD is retained verbatim. Five malformed source blocks contain literal control characters inside JSON strings; the renderer escapes those characters only. Source snapshots and values are retained. The audit identifies all five blocks.
- Existing URLs/canonicals/SEO metadata stay locked for migrated tours. Indexed tour deletion/archive is blocked. SEO landing relationship changes require confirmation. Changed associations and CMS saves retain prior values in the administration log.

## Working interfaces

- Homepage discovery dialog, grouped suggestions for terms/experiences/existing pages, multiple filter chips and actual inventory counts.
- Server-rendered `/search/` results, origin-aware H1, price and name sorting, collapsible filters, mobile filter sheet, private/shared filter, empty state, wishlist and actual CMS featured photos.
- Database-driven destination/origin/type carousels and editable homepage recommendations. Established origin landing pages now filter their experience cards by assigned origins.
- Taxonomy administration: create, read, update, safe delete, ordering, featured/search visibility, image picker/upload, icons, descriptions, tour assignments and existing SEO page links. Starting locations also store transfer details and private operational notes.
- Tour Discovery tab; reusable classifications; private/shared, badges and reviewed factual answers; existing pricing, availability, content, SEO, gallery and related-tour controls. Bulk booking modes and deletion of unused non-migrated drafts.
- Footer navigation and social profiles editable in Admin → Social & footer. Desktop columns, separate accessible mobile accordions, existing horizontal logo, configured/enabled social links only.
- Explicit opt-in analytics. No raw query/contact text is retained. Ninety-day retention; events and distinct-session conversion ratios come from stored records. Booking/enquiry conversions are recorded by the authoritative server actions. All staging bookings remain simulated and are not presented as live revenue.
- Original media is not destroyed: removing a gallery placement retains the file; unused uploaded images may be removed from the library while preserving the file; in-use or migrated media cannot be deleted.

## Validation

- TypeScript and the final build passed.
- 76 compiled Worker integration checks, 16 pricing/search/schema unit checks and 4 owner-isolation checks passed (96 total automated checks).
- Responsive WebP derivatives are generated for 42 existing discovery images; original files/URLs remain available.
- Nine targeted search/schema tests passed: cross-facet filtering, same-facet union, accent-insensitive partial matches, no-results, real tier-price sorting, duplicate archive prevention and repair of all five malformed JSON-LD blocks.
- Compiled Worker regression and CRUD checks run in isolated D1/R2 with separate customer/admin identities. Results are recorded in `search-discovery-test-results.json` after the final run. They cover all 72 source routes, pricing/capacity/idempotency, bookings, vouchers, enquiries, uploads, admin denial, taxonomy CRUD, image/gallery CRUD, draft deletion, social/footer persistence, search SSR, SEO locks, and consented analytics.

## Remaining acceptance limits

The supervised browser started, but browser navigation repeatedly timed out. No visual, touch, keyboard end-to-end, screenshot, Core Web Vitals or real-device pass is claimed. Desktop/tablet/iPhone/Android visual acceptance remains open. Automated server tests do not replace those checks.

Original schema can contain historical prices, reviews or claims inherited from production. Syntax preservation/repair does not constitute rich-result eligibility certification. No new ratings or unsupported rich-result claims were invented.

Taxonomy, footer link and discovery section translations support reviewed French and Spanish names/descriptions. Existing page translation and currency administration remains available. Original copy is retained when no reviewed translation exists.

## Primary technical references reviewed

- https://developers.google.com/search/docs/crawling-indexing/robots-meta-tag
- https://developers.google.com/search/docs/crawling-indexing/canonicalization
- https://developers.google.com/search/docs/specialty/ecommerce/pagination-and-incremental-page-loading
- https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data
