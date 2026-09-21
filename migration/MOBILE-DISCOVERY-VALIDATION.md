# Mobile booking and homepage discovery update

Changes are limited to the private Sites preview. The live TangierExcursions.com website and its URLs, source SEO metadata and redirects are unchanged.

## Changes
- Corrected mobile booking dialog positioning: resets the CSS `translate` property as well as legacy `transform`, which is necessary with the installed Tailwind dialog component. The bottom sheet is viewport constrained, scrollable, safe-area aware, and keeps its action row accessible.
- Availability buttons open a visible loading/error/retry interface instead of remaining disabled after a failed initial request. Requests have a timeout; blocked browser storage no longer interrupts booking effects. Enquiry-only experiences transition into enquiry after loading.
- Travelers and travel dates use relevant icons; shared location and traveler form labels have icons.
- H1 700, H2 600, H3 500, with administrator-editable supported Rubik weights.
- Sixteen requested destinations appear in a horizontal carousel. Cards use graphic treatments unless staff select a destination photo; no unrelated photo is presented as a city image. Cards filter tours or offer a prefilled custom-tour enquiry when none match.
- Admin → Destinations supports name, region, order, visibility, photo and tour associations. Admin → Appearance manages heading weights and tour header/action behavior.
- Tour tabs include Highlights and remain at the viewport top; the main header is hidden when the tabs reach that position.
- Wishlist/share are compact right-aligned icon buttons with accessible labels.

## Verification
TypeScript validation and the final build passed. All 53 compiled-worker checks passed, including all 72 audited route titles/canonicals and the new destination/appearance settings. Results are recorded in mobile-discovery-test-results.json.

Read-only preview Worker logs returned no errors in the preceding 180-minute window. Cloud browser navigation timed out, so touch interaction and responsive visual acceptance remain unverified. The CSS positioning defect was identified in source; a successful API test is not treated as proof of mobile visual behavior.
