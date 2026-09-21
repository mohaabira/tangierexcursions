# Private staging interface refinements

- Desktop navigation: Destinations, Experiences, Help, uppercase 13px/600, aligned right with open space after the logo.
- Account menu: grouped bookings, wishlist and role-gated administration, clearer sign-in/sign-out actions.
- Currency/language: accessible radio-card dialogs with current-selection states and mobile drawer access.
- Admin: full-width workspace; public content retains the 1140px desktop container.
- Tour cards: compact spacing, 18px/600 desktop titles and 15px/600 mobile titles. Published booking reviews take priority; otherwise audited Product aggregate ratings are shown, retaining the distinction between ratingCount and reviewCount. No counts are fabricated. Unknown totals show zero verified reviews.
- Tour tabs: 15px/500, fixed full-width navigation centered on desktop after scrolling, moving underline, reduced-motion support.
- Booking: 330px desktop sidebar, wider booking/calendar dialog, responsive calendar cells. Booking calculations and validation remain unchanged.
- Mobile search: uses the visual viewport for keyboard-aware height, dedicated scrolling body, nonshrinking submit action, safe-area padding, restored trigger focus, and no forced keyboard opening.
- The additional origin carousel is disabled through the persisted homepage configuration. The prior configuration is preserved by migration 0002. Origin records/search and the Morocco carousel remain available; administrators can re-enable the section.

Validation: TypeScript and the final production build passed. All 79 compiled Worker regression checks passed; results are stored in platform-refinement-test-results.json. All 72 original routes retained their audited titles and canonical URLs. Admin persistence, booking validation, media protection and search checks passed. git diff --check passed.

Browser navigation again timed out. No visual, touch, keyboard end-to-end or device-width pass is claimed. The changes address the identified code/layout issues, but visual/mobile acceptance still requires testing in the private preview.

No production TangierExcursions.com, public access, payments or external email delivery changes.
