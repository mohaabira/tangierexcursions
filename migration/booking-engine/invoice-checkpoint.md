# Invoice and navigation checkpoint

Extends the prior partner/gift checkpoint; the complete marketplace brief remains unfinished.

- Direct Partners desktop navigation added; mobile/footer links retained.
- Administrator can enable invoice payment arrangements, set 0–120 day terms and configure credit limits in EUR cents.
- Invoice snapshots reference canonical booking IDs, with billing identity and due dates preserved.
- Atomic booking insert checks both shared tour capacity and outstanding organization credit. Two simultaneous invoice bookings cannot exceed the limit.
- Invoice/credit views require partner admin or finance membership; platform administrators retain access.
- Receipt ledger drives outstanding/partially-paid/paid/overdue projections and available credit.
- Printable documents clearly say development/test invoice, not legal tax invoice.
- Invoiced booking amendments currently require finance review rather than silently changing issued amounts.

Validation: build, TypeScript and 81 automated checks passed (20 partner/gift/invoice, 26 unified booking, 15 website workflows, 20 review workflows). Tests use disposable databases. Browser visual/mobile QA remains unavailable/unverified.

Prepared for the private Sites test preview only. TangierExcursions.com production is not a deployment target. External payments, real email delivery, legal tax configuration, invoice adjustments/net settlement, and the other remaining features in partner-gift-implementation.md are still not complete.
