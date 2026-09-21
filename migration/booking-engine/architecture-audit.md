# Unified booking architecture audit

Scope: Tangier Excursions private development checkout. Production has not been accessed or changed. Baseline source: 0f8c732bbd0f214b7c6f795ee10e282f810bd3c7. The source-baseline.json file preserves the pre-refactor implementations. It is NOT a backup of hosted booking records.

| Existing component | Store / workflow | Finding | Shared target |
|---|---|---|---|
| Public/mobile reservation | /api/quote and /api/booking, bookings table | Repeated date, pricing, coupon, capacity and deposit rules | priceBooking / createBooking |
| Server pricing | lib/pricing.ts, tour settings | Stable tier, seasonal, child, extra logic | Reused without replacement |
| Capacity | Conditional SQL insert; public availability and discovery reads | Shared table but duplicated predicates | availability and capacity-guarded canonical writes |
| Customer cancellation / admin status | Separate route-handler SQL updates | No shared state machine or finance handling | changeBookingStatus |
| Customer account, vouchers | Existing bookings IDs and token | Existing relationships must remain compatible | Same table and IDs; no copy/move |
| Passport collection | Encrypted records keyed passengers:bookingID | Existing owner-only access not safe for partner-owned records | Retained encrypted store; partner bookers denied document payload |
| Supplier notifications | Supplier records reference booking ID | Test outbox; configured suppliers; idempotent assignment IDs | Existing operations consumer called from durable booking events |
| Verified reviews | Completed booking ID | Working review eligibility and moderation | Existing completion consumer retained |
| Payments | Text SIMULATED, no real payment provider | No payment ledger found | Booking-linked simulated payment/refund ledger |
| Custom trips | lead records | Enquiries do not become bookings | Admin conversion links existing lead to same canonical booking |
| Partners, commissions | Not found | No previous B2B implementation to migrate | Partner membership records; canonical partner booking fields |
| Gifts / book for someone | Not found | No previous gift engine to migrate | Participant roles and gift metadata on same booking |
| Email | Shared queueEmail, test-outbox | No external delivery | Retained, deterministic initial booking email IDs |
| Administration | Bookings list / status controls | Limited master view | Canonical booking workspace with detail, activity and filtered journeys |

## Authoritative model

The existing `bookings` table remains the sole writable operational booking store. Its IDs, tokens, URLs, request keys, customer ownership and existing JSON data are retained. Optional channel fields are stored in that same JSON object. Historical rows without a bookingType are projected as DIRECT; no historic money is inferred from a confirmed status. Existing status `test-confirmed` is retained to avoid implying live confirmation/payment.

Auxiliary records reference booking ID: booking-event, booking-payment, passengers, supplier-notification, reviews. These are associated ledgers/operations, not duplicate booking stores. Partner membership is server-enforced. Partner listing and detail permissions share the same check. Guest email fields do not grant account access.

## Transaction / retry boundaries

- Creation and durable created event are written in one D1 batch.
- Conditional SQL enforces capacity in the database, including concurrent channels.
- Existing unique owner/request_key protects booking creation retries.
- Amendment, payment and status changes use compare-and-swap against the previous data value and a fresh revision ID; accompanying records insert only if that revision was written.
- Initial booking email uses a deterministic record ID. Failed event consumers remain retryable.
- No external charge/refund is initiated. Ledger entries are explicitly simulations.

## Not yet accepted for rollout

This is a development checkpoint, not a completed 82-requirement migration. See implementation-report.md. No historical hosted-record count or production revenue reconciliation has been claimed. No operational data was deleted.
