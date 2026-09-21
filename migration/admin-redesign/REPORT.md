# Admin audit and migration report

Development preview only. No production domain, live payments, email delivery, or indexed assets were modified.

## Scope and counts

- 39 existing top-level admin screens inventoried and mapped.
- All 39 retained within a shared full-width workspace and design system, organized into 11 primary groups. This is shell/design-system coverage, not a claim that every individual legacy control has been rewritten.
- Two duplicate presentations resolved: Destinations formerly rendered two editors simultaneously; Analytics formerly repeated Dashboard.
- Two legacy wrapper screens replaced: Languages and global booking/currency settings. The old source file remains for rollback but is not rendered by these navigation entries.
- New dedicated screens: Homepage section manager, Operations, Payments, Change history, Destination pages (split from Destinations).

## Screen mapping

| Previous screen | Current location | Data / service | Findings and change |
|---|---|---|---|
| Dashboard | Dashboard | bookings, records/admin-log | Operational summary; previously duplicated by Analytics |
| Bookings | Bookings → All bookings | bookings; booking-service; ledger, participant and event records | Canonical engine retained; pagination, deep links and destructive confirmations added |
| Partners | Partners | partner-service, partner-finance, invoices | Existing company/users/catalog/commercial/statements/invoices/messages retained; creation moved here |
| Gifts | Bookings → Gifts | gift-workspace; gift-delivery; canonical booking | Delivery remains test outbox; no live scheduler added |
| Calendar | Bookings → Calendar | bookings | Retained date list; not a drag/drop scheduling calendar |
| Tours | Tours → All tours | product:, golden:, tour:, discovery_links | Smaller editor tabs, draft recovery, history, icon picker; SEO opens existing unified module |
| Transfers | Tours → Transfers | same tour CMS filtered by productType | Same reusable editor and booking logic |
| Destinations | Tours → Destinations; Destination pages | discovery_terms/links; hub:destination | Former double render split into taxonomy and page editors, same records |
| Starting locations | Tours → Starting locations | discovery_terms/links | Retained classification CRUD |
| Trip types | Tours → Trip types | discovery_terms/links | Retained classification CRUD |
| Activities | Tours → Activities | discovery_terms/links | Retained classification CRUD |
| Duration | Tours → Duration | discovery_terms/links | Retained classification CRUD |
| Social & footer | Marketing → Social & footer | discovery-config | Existing social/footer/discovery collections retained |
| Search & discovery | Analytics → Search & discovery | consented discovery events | Existing measured analytics retained |
| Appearance | Settings → Appearance | config.design | Existing public brand settings retained |
| Tour Content Review | Tours → Tour Content Review | golden source and migration coverage | Original-versus-structured comparison retained |
| Reusable Information | Content → Reusable Information | golden-shared | Inherited copy retained |
| Maps | Operations → Maps | golden-shared.maps | Provider, zoom, animation retained |
| Pricing | Tours → Pricing | tour: | JSON seasonal/date rules replaced by structured forms |
| Coupons | Marketing → Coupons | coupons | Existing server-side discount logic retained |
| Availability | Tours → Availability | tour: | Shared pricing/availability editor retained |
| Customers | Customers → Customers | canonical bookings | Searchable customer profiles with bookings, reviews, private notes and booking activity |
| Enquiries | Customers → Enquiries | records/lead | Assignment/status/notes retained |
| Reviews | Tours → Reviews | reputation/review engine | Moderation and photo workflows retained |
| Help Center | Content → Help Center | hub:faq + reusable tour FAQs | Draft recovery/history added; existing reuse retained |
| About Us | Content → About Us | about CMS published/draft/revisions | Existing visual block and revision editor reused |
| Homepage offers | Marketing → Gift offer & newsletter | config.homeMarketing | Existing banner and subscriber functionality retained |
| Pages | Content → Pages | page: + editorial | Draft recovery/history added; source copy retained |
| Blog | Content → Blog | page: + editorial | Same structured editorial editor; draft default URL no longer new-tour |
| Media library | Content → Media library | R2, media records, media-meta: | Bulk upload; existing alt/caption/folders/tags; homepage-use deletion guard |
| Email templates | Content → Email templates | email:, test outbox | Draft recovery/history; dedicated data query, shared branding retained |
| SEO & AI Visibility | Marketing → SEO & AI Visibility | existing seo platform/settings/records | Stable modules reused; tour editor linked to same panel |
| Languages | Settings → Languages | translation: | Standalone editor replaces old dashboard wrapper |
| Transfer routes | Operations → Transfer routes | routes | Existing reviewed route data retained |
| Analytics | Analytics → Overview | canonical booking views | Replaced duplicate dashboard with booking-type/tour breakdowns |
| Users | Settings → Users & roles | staff, staff-roles, private-preview-owner | Scoped content/SEO/operations/finance/partner-manager permissions; legacy owner/admin retained |
| Integrations | Settings → Integrations | integrations | Existing future config retained, simulation accurately labeled |
| Company details | Settings → Company details | company | Existing company/logo editor retained |
| Settings | Settings → Booking & currencies | config | Structured currency inputs replace JSON; drafts/history added |

## Safety architecture

Homepage order/visibility/carousel selection uses `settings.homepage-layout`, separate from product, golden content, pricing, and SEO records. Existing default sections and exact headings/layout components are preserved. Disabled sections retain their configuration. Hero and original SEO copy stay protected. Discovery assignments remain explicit database relationships.

Autosave uses per-user `editor-draft` records; it does not write published content. Previous tour/page/FAQ/email/settings/homepage states are captured as `editor-revision` records. Restoring loads a draft for review and uses the original validated save endpoint. About Us retains its existing richer revision workflow. No new duplicate booking system exists. Operations and Payments read canonical booking summaries.

Scoped staff authorization is checked before invoking existing services. A server-only authorized actor is passed to legacy service functions; this is never accepted from a client. Full admin/settings records remain administrator-only. Content bootstrap excludes guest and integration records. Staff drafts are owner-isolated. Existing owner bootstrap and administrator allowlists are preserved.

## Remaining work / limitations — not a complete acceptance claim

- Full visual and cross-browser QA is pending: the supervised browser failed to load the internal preview after navigation and one reload. No desktop/tablet/mobile screenshot pass is claimed. Requested Safari/Firefox/Edge/iOS/Android matrix needs manual testing.
- Existing finance and email operations remain simulations; no gateway or outbound notification service is activated.
- Customer profiles now include linked bookings, reviews, private persistent notes and booking activity. A standalone customer messaging composer is not added; booking/partner messaging remains the existing workflow.
- Global command search covers workspaces, catalog pages, and booking/guest references. Partner, invoice, voucher and gift-code indexing still needs expansion.
- Existing partner resources/contracts and supplier confirmation sub-workflows remain limited to the functionality already present; the redesign does not invent those services.
- Persisted autosave/revisions are integrated in Tours, Pages/Blog, FAQ, email, booking settings and homepage; several other editors retain explicit save plus their existing audit history. A universal draft engine across every settings form is not claimed.
- Undo/redo uses bounded local editor history; rich-text selection-level history remains the About editor’s existing implementation.
- Media delete is guarded and reversible; full focal-point editing and binary replacement are not yet implemented across all consumers.
- Some existing tables still use horizontal scroll on small screens; the main tour table uses responsive records. Table-wide column customization/export is not universal.
- The Golden structured editor uses paragraph/list fields. The existing About/editorial block editors are reused; a universal unrestricted block builder has intentionally not been added.
- Tour editor saves product and structured content in one validated D1 batch; prior revision is part of the same batch. Legacy API compatibility endpoints remain available. Multi-editor optimistic conflict handling is still not universal.
- Legacy editor interiors retained under the shared design system include SEO, reputation, partner finance, gifts, classification editor, migration comparison, company, integrations, coupons, route lists and appearance. They are preserved, not falsely described as completely rebuilt.

## QA evidence

`qa-results.json` records the new executable integration checks. Existing booking, partner/gift and reputation suites are rerun separately. A build/typecheck is not a substitute for browser UX testing.

### Final execution results

- TypeScript check and production build: passed.
- Admin redesign: 22 checks passed.
- Homepage marketing: 7 checks passed.
- Unified booking: 26 checks passed.
- Partner/gift: 20 checks passed.
- Reputation: 20 checks passed.
- Legacy search-discovery suite: stopped after 23 passing checks. Its fixture cancels a booking and later attempts to mark that same cancelled booking completed; the current booking state machine correctly rejects that transition. The remaining checks in this older suite were not executed. No production logic was weakened to accommodate the fixture.
- Browser/device visual checks: blocked by the internal preview transport; not marked passed.

All integration tests used disposable local databases. The live TangierExcursions.com website and live data were not changed.

### Homepage carousel follow-up

Fixed name-dependent category matching by resolving stable IDs (including saved legacy names). Partial homepage settings merge missing approved sections without overriding explicit visibility. The original three collections use audited relationships for recovery when normal selection is empty; custom filters and manually selected products are never replaced. The editor now shows matching tour counts and offers explicit collection recovery.

All 26 admin integration checks passed on the final build, including four new assertions that actual tour cards render in each of the three carousels under normal, renamed-category, missing-relationship and partial-configuration conditions. TypeScript and build passed. These are server-rendering checks, not a claim of hosted browser visual verification.
