> Updated preview: see migration/REFINEMENT-VALIDATION.md for the latest implemented features, tests and remaining limits. Earlier sections below describe the first build.

# Tangier Excursions — isolated development project

This is a separate development copy. No production deployment, DNS change, live payment, email delivery or WordPress mutation has been performed. Opening the ZIP does not launch an interactive website.

## What is included

- 72 audited page routes and original metadata, schema, image and link records.
- Full read-only HTML snapshots of the 72 pages, sanitized page content, 287 downloaded media files, original sitemap files, and locally hosted Hind font weights.
- A responsive blue/gold storefront using the existing logo; tour discovery, gallery, wishlist, custom-tour modal, tour pages and booking panel.
- 30 imported EUR per-person pricing tables, with server-side totals, validated group boundaries, availability capacity and blackout dates.
- A persistent local D1 test database for bookings, leads, wishlists, profiles, test-email outbox, settings and admin changes.
- Test bookings, duplicate-request protection, customer record isolation, staff-only voucher verification and QR-token revocation on cancellation/status changes.
- Customer account and staff dashboard; editable tier pricing, availability, deposits, currencies, translations and 18 email-template records.
- English/French/Spanish navigation and reviewed per-page translation storage. Reviewed translations also have `/fr/…` and `/es/…` routes and metadata. The original English content is retained.
- Noindex development metadata and robots rules. Original audit robots metadata remains in the source archive for future production reconciliation.

## Important limits

This is a development implementation, not a complete production migration or a claim that every feature in the extensive migration specification is finished.

- Payments are simulated. No payment provider is connected.
- Email templates render and booking/enquiry emails are saved to a test outbox. No external delivery or automated reminder scheduler is connected.
- The exchange rates are manually configured test rates, not a live market feed.
- French and Spanish page translations must be entered and reviewed. The entire booking/account/admin interface has not been translated. Draft/untranslated language routes return 404.
- Customer authentication uses the platform ChatGPT sign-in path, plus explicit development-only test identities. A standalone public email/password account and recovery service is not implemented.
- The content/SEO dashboard inventories original source records; a full English page-builder/CMS is not implemented.
- Child/infant pricing, date-specific/seasonal supplements, paid extras, per-group price mode and review moderation UI remain outside this initial implementation. Group tiers, per-person pricing, capacity and blackout dates work.
- The original long-form copy is retained in readable source-content sections; the homepage keeps it in a native expandable section. Further editorial/layout review is needed before production.
- Legacy URLs absent from the sitemap remain recorded in the audit. Unknown source links retain their original production destination; their redirects have not been recreated without evidence.
- Two old TripAdvisor badge images already return 404 at the source. They remain recorded in the media manifest and are omitted from rendered content.
- This runtime has no user-facing local-preview handoff. An interactive preview inside ChatGPT requires a separate private Sites deployment, which has not been authorized or performed.

## Run locally (Node 22.13+ and the package manager version in package.json)

1. Extract this folder and install dependencies with `pnpm install`.
2. Run `pnpm run build`. The compiled output is also included in this package.
3. Initialize the local database once:

```sh
node --import ./scripts/sites-env.mjs ./node_modules/wrangler/bin/wrangler.js d1 execute DB --local --config dist/server/wrangler.json --persist-to .wrangler/state --file drizzle/0000_eager_puma.sql
```

4. Start development with `pnpm run dev` and open the local address printed by the command.
5. Use **Test sign in → Test customer** for booking tests, and **Test admin** for operations. These identity shortcuts exist only in development mode and are disabled in the compiled production Worker.

`pnpm run start` runs the compiled Worker locally, without development identity shortcuts. Hosted authentication requires the platform dispatcher. Do not point a production domain at this build.

## Test a journey

1. Open the Tarifa day-trip page.
2. Choose a future date and four travelers. The published tier produces EUR 87 per person / EUR 348 total.
3. Continue, enter fictitious guest and pickup information, and confirm the test booking.
4. Open My Account to view the booking and printable QR voucher.
5. Switch to the administrator test identity and open the voucher verification URL.
6. Cancel the booking as its customer and verify that the original QR token is rejected.
7. Submit a custom-tour request and inspect Leads and the test outbox.
8. Edit pricing, capacity, blackouts or manual currency rates in Administration and start a fresh booking to check the result.

## Verification

```sh
node --experimental-strip-types --test tests/pricing.test.mjs
node tests/workflows.mjs
node node_modules/typescript/bin/tsc --noEmit
```

The workflow tests run the compiled Worker in an isolated Miniflare test environment. Authenticated test headers are supplied by the harness; they are not public login credentials. No live customer data is used.

See `migration/workflow-test-results.json` and `migration/VALIDATION.md` for verified results and limitations.

## Before any production migration

Reconcile the WordPress database, redirects and media library; finish the remaining specification; supply reviewed translations; integrate and test real payment and email providers; replace manual test rates if live rates are required; complete accessibility/mobile/browser QA; verify SEO diffs; reconcile incoming bookings; prepare rollback. Production launch requires a separate explicit instruction.

## Private hosted testing
The isolated owner-only Sites deployment enables PRIVATE_PREVIEW_OWNER_BOOTSTRAP. Its first platform-authenticated visitor is bound once as the preview administrator in D1. This is safe only because the hosting audience is verified owner-only before enabling it. Other authenticated identities remain customers. Disable this setting and configure explicit ADMIN_USER_IDS before sharing or production migration. Payments and outbound email remain simulated.
