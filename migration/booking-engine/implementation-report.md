# Booking engine implementation checkpoint

Status: NOT COMPLETE. No deployment or hosted data migration performed. The pending schema migration adds only a capacity-query index; it does not rewrite booking rows.

## Implemented in the development source

- One bookings table retained, including legacy IDs, review relationships, tokens and original data.
- Existing public quotation, creation, cancellation and staff transitions call shared services.
- Existing tier, child, season, extra and coupon pricing reused server-side.
- Conditional creation/amendment capacity checks and idempotent creation keys.
- Direct, partner, book-for-someone, fixed/flexible gift, administrator and custom-enquiry conversion paths use createBooking.
- Partner membership enforcement and 15% hotel scenario in isolated tests.
- Purchaser/traveler roles, partner attribution and gift metadata on canonical booking.
- Shared booking list/master detail, event timeline, amendments and simulated payment/refund ledger.
- Gift scheduling amends the original booking ID.
- Admin account workspace and a separately authenticated booking workspace consume the same APIs.
- Existing passport/supplier/review workflows retained; partner access to passport plaintext blocked. Booking amendments flag documents for revalidation and suppliers for reconfirmation; cancellation clears the collectible balance and marks supplier assignments cancelled.
- Shared, authenticated voucher/gift/draft-statement renderer with actual QR verification and configured company branding. Gift format hides price rows.
- Recipient-bound, expiring payment/gift links with hashed tokens, repeat-submission protection and no duplicate booking creation. Gift redemption rejects changed pricing until the team reviews it.
- Refunds reduce net receipts without recreating refunded customer debt.
- Partner-tour commission override priority supported by API; full rule-editing UI remains pending.
- Revoked partner membership blocks former booker access, including account listings. Review metadata edits now pass through the shared service and activity log.

## Data reconciliation

Hosted records before: NOT MEASURED. Hosted records after: unchanged by this work; NOT MEASURED. No hosted database write or migration was performed. Local QA fixture totals are in qa-results.json and must not be represented as business totals.

Historical booking fields are not overwritten or backfilled. Missing bookingType is projected as DIRECT. Missing participant data is displayed using legacy name/email fields. Historic payment text is preserved and is not interpreted as proof of money received.

## Remaining acceptance work

- Full partner onboarding, partner portal navigation, permissions for operations/finance roles and scalable pagination/search.
- Approved partner-tour/global/net-rate rule editor; current partner percentage calculation is implemented, but the complete rule editor is not.
- External payment provider, legal invoice configuration, verified webhooks and chargebacks. Recipient-bound deposit/balance links now operate against the same booking in simulation only.
- Gift delivery scheduling, commercial gift-expiry terms and recipient account listing. Secure recipient-bound gift redemption and price-hidden gift voucher rendering now exist. Link expiry is seven days and does not define commercial gift validity.
- Custom proposal/acceptance workflow and bespoke pricing; current conversion links an existing enquiry to a bookable catalog experience.
- Partner co-branding assets, legally configured invoices/statement aggregates and commission payout ledger (draft booking statements and basic voucher variants now exist).
- Reviewed structured cancellation terms. Cancellation is recorded with refund review required; it does not invent refund eligibility from prose.
- Temporary checkout holds/expiry and lifecycle expansion beyond retained staging statuses.
- End-to-end passenger portal access for recipient/traveler roles, participant-linked document rows and document revalidation after party changes.
- Supplier acknowledgement/confirmation portal and fully transactional outbox delivery for all legacy consumers. Local supplier record amendment/cancellation reconciliation exists.
- Complete canonical financial analytics, participant account visibility, global booking search and migration snapshot/export UI.
- Full recipient-specific notification coverage for purchaser/traveler/partner and scheduled gift delivery. Existing confirmation/review outbox behavior is retained; not all requested event-to-email variants are finished.
- Hosted historical reconciliation and browser/mobile end-to-end QA.

No production readiness or full acceptance is asserted. Existing published preview stays unchanged until the broader QA gate is met.

## Validation checkpoint

62 automated checks passed: 27 canonical booking scenarios, 15 existing website workflows, and 20 review/reputation regressions. TypeScript and the production build passed. Tests ran on disposable local databases with all schema migrations applied. Browser/mobile verification and hosted historical reconciliation have not been completed.
