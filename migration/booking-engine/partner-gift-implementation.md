# Partner and gift implementation — development checkpoint

This extends the canonical booking engine. It is not a complete implementation of the 107-section brief and is not production-ready. No hosted database writes, site deployment, real payment, or external message delivery occurred.

## Working development functionality

| Area | Implemented |
| --- | --- |
| Partner applications | Branded /partners/ page, authenticated application submission, consent timestamp, persistence, review/reject/approve controls |
| Approval | Organization and initial partner admin created from the application, conditional writes and activity history |
| Organizations | Company/contact/billing fields, status, pickup defaults, commercial percentage, assigned catalog, enabled guest/partner payment arrangements |
| Team | Admin/booker/finance/read-only roles, expiring hashed email-bound invitation links, one-time acceptance, role updates/deactivation, last-admin guard |
| Access | Server-side organization isolation; suspension blocks catalog/booking access; read-only users cannot book, amend, cancel or invite |
| Catalog | Real published experience data and photos, search, eligible/excluded experience enforcement in quotation |
| Concierge | Dedicated /partners/portal/, catalog, booking workspace, pickup default, shared availability/pricing/calendar/booking ID |
| Commercial rules | Percentage, fixed amount, net amount, no commission; effective dates; partner+tour > partner > tour > global; explicit after-discount basis; saved booking snapshot |
| Finance | Monthly commission statement, CSV, earned/pending amounts, administrator-only simulated payout records, idempotence and overpayment checks |
| Messaging | Organization-scoped persistent messages, no external transmission |
| Gifts | /gifts/ catalog, fixed/flexible date checkout, purchaser/recipient separation, message preview, hide-price option, saved immediate/self/scheduled delivery metadata |
| Delivery queue | Database jobs with due time/timezone, claim/retry state and deterministic test email; administrator-run processing; future jobs excluded |
| Branding | Existing branded emails reused; gift email financial rows suppressed; optional partner logo/name on voucher; internal booking notes removed from guest voucher |
| Admin | Partners, Gifts, applications, company settings, users, catalog assignments, commercial rules, statements, messages, activity and navigation settings |
| Navigation | Configurable partner/gift links in existing desktop/mobile header and footer; account entry points |
| Preservation | Existing tour URLs, catalog source, SEO metadata and legacy booking records retained. No second booking table. Private/new development routes noindex. |

## Important operational boundaries

- All financial actions still simulate payments. No gateway, verified payment webhook, chargeback or live settlement integration is configured.
- Gift delivery creates a test outbox email. It is not an externally sent/delivered message. A durable queue is implemented, but an automatic hosted scheduler and real email transport are not connected.
- Invitation links can be copied; they are not emailed automatically. Authentication uses the existing Sites identity. Public guest checkout without an account is not implemented.
- Invoice issuance, credit-limit enforcement and legal tax configuration remain unfinished. The invoice arrangement was removed from new UI choices. Legacy simulated invoice records remain readable and unchanged.
- Partner statements are live projections and CSV exports, not issued legal invoices or immutable period-close accounting. Reversals after payouts need finance review.
- Gift expiry/extension/transfer, opened tracking, rescheduling UI, richer recipient account access, delivery emails with recipient access links and branded gift PDF downloads remain unfinished.
- Resources/contracts, QR campaign attribution, saved guests/duplicate booking shortcuts, private partner-only products, global operations/finance RBAC and complete lifecycle notification coverage remain unfinished.
- Homepage gift/partner editorial sections, per-tour gift CTA, partner/contact FAQ integration and full SEO-module registration for the new public pages remain unfinished.
- Commercial rules currently calculate on booking total after discounts. Configurable tax/base/subtotal bases and net settlement remain unfinished.
- No claims of full brief acceptance or production readiness are made.

## Verification

Build and TypeScript checks passed. Functional evidence is in partner-gift-qa.json, alongside the existing canonical booking, workflow and reputation tests. These tests use disposable local databases, not actual customer or partner records.

Browser preview startup succeeded but the cloud browser reload timed out. Desktop/tablet/mobile visual QA and real device testing are NOT verified. The published Sites preview remains unchanged.
