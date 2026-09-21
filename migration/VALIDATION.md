# Validation — 16 September 2026

## Passed

- TypeScript static check.
- Full framework build.
- Seven automated source/pricing checks: tier boundaries, integer-cent totals, invalid guest counts, tier overlap validation, quote-only behavior, unique 72-route import, and exact source metadata/schema/image/link parity.
- Fifteen compiled-Worker integration checks: authoritative price calculation, impossible-date rejection, admin authorization, ignored client amount, idempotent booking, customer isolation, staff-only QR access, minimal verification payload, persisted wishlist and email outbox, QR revocation, saved custom enquiry, concurrent capacity protection, disabled production test identities, representative server-rendered route metadata/noindex, and true 404 behavior.

## Browser observation

The desktop homepage rendered and was visually inspected; the corrected logo contrast was captured in the final screenshot. The currency selector exposed EUR, USD, GBP and MAD; selecting USD changed the EUR 57 card price to USD 62.70. The custom-tour modal opened with its first-step fields. The browser connection intermittently timed out during navigation and interaction, so complete browser end-to-end and mobile-viewport checks are not claimed. Automated Worker tests cover the backend independently of that connection. A database-uninitialized error was observed before the local schema was installed; migrations were then applied locally.

## Migration preservation boundary

Original source records are immutable in `migration/original-audit.json`; raw page snapshots are in `migration/source-pages/`. Rendered content is sanitized, headings are normalized beneath the page H1, internal links to audited routes are local, and noindex is intentionally added to the development site. Runtime settings can override tour prices in the preview, while original pricing remains in the archived records. Existing analytics scripts are archived, not executed in the development environment.

No statement here guarantees Google rankings or validates a future production launch. No site has been deployed.
