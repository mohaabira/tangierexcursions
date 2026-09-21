# Tangier Excursions — Golden Tour rollout report

Development preview only. Production TangierExcursions.com was not modified.

| Measure | Result |
|---|---:|
| Published products in the audited catalogue | 40 |
| Using the shared Golden Tour presentation, with rendered-page checks passed | 40 |
| Requiring content review | 40 |
| Fully accepted against every requested criterion | 0 |

The presentation rollout is implemented across all 40 products. The overall acceptance gate remains open because source information and browser/device QA are incomplete.

## Implemented and tested

- One shared Golden Tour component; the legacy tour-layout fallback was removed. No Tarifa itinerary, media or prices were copied to another tour.
- Every audited tour renders its own title, images, canonical and existing metadata. All 40 structured editors save and reload against an isolated persistent database. The original source HTML remains available for comparison.
- Dedicated guest reviews are available even when Before You Go is absent. Custom-tour requests retain the current tour and the custom action is explicitly visible on mobile.
- Every priced/bookable product passed a server quote and test booking. Per-person, per-group and fixed-total tiers, deposits and currency conversion passed calculation checks.
- Wishlist save/reload/remove checks cover every tour. Existing schema blocks parse as JSON in rendered responses; no new ratings or schema claims were fabricated.
- Ferry inclusion defaults only from explicit round-trip-ticket inclusion wording: 24 tours. Admin can override the flag and assign suppliers.
- Confirmed ferry bookings create secure passenger requests. Partial and complete submissions are encrypted with a server-only AES-GCM key. Owner/admin access checks, restricted supplier payloads and duplicate-notification prevention passed.
- Supplier messages and customer messages remain in the development test outbox; no external emails were sent.
- Review moderation, booking ownership, photo upload/consent/publication, secure QR links, reminder limits and localized email persistence passed the 20-check reputation suite. All branded email templates now specify Rubik with an email-safe fallback.

## Remaining acceptance gaps

- Cancellation policy: all 40 structured source records lack reviewed policy text. A shared-policy editor exists, but no terms were invented or inherited without confirmation.
- Route maps (updated): all 40 products now expose the shared map. The Tarifa map retains its existing coordinates; 39 additional products use approximate named locations extracted from source content and GeoNames. Exact stop completeness and sequence still require review. Connecting lines are disabled for these new maps until admin review. See `ROUTE-LOCATION-SOURCES.json` and `MAP-HOME-PERFORMANCE-QA.json`.
- 16 products retain sequential source itineraries; exact time schedules were not invented. Seventeen have day-based itineraries and seven have timed itineraries.
- Missing content is listed below. Empty optional sections stay hidden. Imported classification should still be reviewed, especially lengthy inclusion blocks in legacy content.
- Supplier identities/contact details have not been supplied; test fixtures verified the workflow. Real assignments must be configured in admin.
- The existing post-tour workflow schedules review requests and processes its due queue into the test outbox. A continuously running background scheduler and external email delivery are not configured.
- Browser preview returned “This page couldn’t load.” Desktop/tablet/mobile interaction, calendar fit, overflow, console errors, screenshot comparison and real-device Safari/Chrome/Firefox tests therefore remain unverified. Server-rendered and API checks are not a substitute for that acceptance gate.
- The inventory and tests use the checked-out audited catalogue and isolated test database, not a production database export. No production systems were accessed.

## Per-product exceptions

| Tour / unchanged URL | Itinerary mode | Booking check | Required attention |
|---|---|---|---|
| 2-Day Trip to Morocco from Gibraltar — `/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 2-Day Trip to Morocco from Malaga — `/best-tangier-tours/2-day-trip-to-morocco-from-malaga/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 2-Day Trip to Morocco from Marbella — `/best-tangier-tours/2-day-trip-to-morocco-from-marbella/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 2-Day Trip to Morocco from Seville — `/best-tangier-tours/2-day-trip-to-morocco-from-seville/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 2 Day Trip to Morocco from Spain — `/best-tangier-tours/2-day-trip-to-morocco-from-spain/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 3 Day Morocco tour from Gibraltar — `/best-tangier-tours/3-day-morocco-tour-from-gibraltar/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 3 Day Morocco tour from Malaga — `/best-tangier-tours/3-day-morocco-tour-from-malaga/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 3 Day Morocco tour from Marbella — `/best-tangier-tours/3-day-morocco-tour-from-marbella/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 3 Day Morocco tour from Seville — `/best-tangier-tours/3-day-morocco-tour-from-seville/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| 3 Day Morocco tour from Tarifa — `/best-tangier-tours/3-day-morocco-tour-from-tarifa/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| PRIVATE 5 DAY MOROCCO TOUR FROM SPAIN — `/best-tangier-tours/5-day-morocco-tour-from-spain/` | day | Enquiry only — no configured tiers | Missing faqs; Map coordinates require review; Cancellation policy requires review |
| TRAVEL FROM SPAIN TO MOROCCO 3 DAYS / 2 NIGHTS — `/best-tangier-tours/travel-from-spain-to-morocco/` | day | Enquiry only — no configured tiers | Missing faqs; Map coordinates require review; Cancellation policy requires review |
| 4-Day Morocco Tour from Spain — `/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/` | day | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Morocco Desert Trip From Spain 11 D / 10 N / Tangier Excursions — `/desert-trips/morocco-desert-trip-from-spain/` | stop | Enquiry only — no configured tiers | Missing highlights; Missing itinerary; Missing included; Missing excluded; Missing faqs; Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| BEST PRIVATE MOROCCO TOUR 10 DAYS / 9 NIGHTS — `/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/` | day | Enquiry only — no configured tiers | Missing faqs; Map coordinates require review; Cancellation policy requires review |
| MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS — `/morocco-vacation-packages/marrakech-desert-tour/` | day | Enquiry only — no configured tiers | Missing faqs; Map coordinates require review; Cancellation policy requires review |
| MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS — `/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/` | day | Enquiry only — no configured tiers | Missing faqs; Map coordinates require review; Cancellation policy requires review |
| Morocco Trip 15 Days/14 Nights — `/morocco-vacation-packages/morocco-trip-15-days-14-nights/` | day | Enquiry only — no configured tiers | Map coordinates require review; Cancellation policy requires review |
| Benalmadena to Morocco Day Trip — `/tangier-day-trips/benalmadena-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Cadiz to Morocco Day Trip — `/tangier-day-trips/cadiz-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Day Trip from Marbella to Morocco — `/tangier-day-trips/day-trip-from-marbella-to-morocco/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Luxury Day Trip to Morocco from Spain — `/tangier-day-trips/day-trip-to-morocco-from-spain/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Best Day Trip to Tangier and Asilah — `/tangier-day-trips/day-trip-to-tangier-and-asilah/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Best Tangier and Tetouan Day Trip — `/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Private Estepona to Tangier Day Trip — `/tangier-day-trips/estepona-to-tangier-day-trip/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Fuengirola to Morocco Day Trip — `/tangier-day-trips/fuengirola-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Best Day Trip to Tangier from Tarifa, Spain — `/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/` | stop | Server quote passed | Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Luxury Malaga Day Trip to Morocco — `/tangier-day-trips/malaga-day-trip-to-morocco/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Rota to Morocco Day Trip — `/tangier-day-trips/rota-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Sotogrande to Morocco Day Trip — `/tangier-day-trips/sotogrande-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Tangier Day Trip from Seville — `/tangier-day-trips/tangier-day-trip-from-seville/` | stop | Server quote passed | Missing itinerary; Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Cultural Tangier Food Tour — `/tangier-day-trips/tangier-food-tour/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Best Tangier Guided Walking Tour — `/tangier-day-trips/tangier-guided-walking-tour/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Private Tangier Shore Excursion — `/tangier-day-trips/tangier-shore-excursion/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Tangier to Chefchaouen Day Trip — `/tangier-day-trips/tangier-to-chefchaouen-day-trip/` | stop | Server quote passed | Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Tarifa to Chefchaouen Day Trip — `/tangier-day-trips/tarifa-to-chefchaouen-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Torremolinos to Morocco Day Trip — `/tangier-day-trips/torremolinos-to-morocco-day-trip/` | time | Server quote passed | Map coordinates require review; Cancellation policy requires review |
| Tangier to Chefchaouen Taxi & Airport Transfers — `/tangier-taxi/tangier-to-chefchaouen-taxi/` | stop | Enquiry only — no configured tiers | Missing highlights; Missing itinerary; Missing included; Missing excluded; Missing faqs; Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Private Taxi Transfer Tangier To Fes Via Chefchaouen / Tangier Excursions — `/tangier-taxi/tangier-to-fes-via-chefchaouen/` | stop | Enquiry only — no configured tiers | Missing highlights; Missing itinerary; Missing included; Missing excluded; Missing faqs; Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |
| Best Private Tangier Airport Taxi Transfers / Tangier Excursions — `/taxi-transfers/tangier-airport-taxi/` | stop | Enquiry only — no configured tiers | Missing highlights; Missing itinerary; Missing included; Missing excluded; Missing faqs; Map coordinates require review; Cancellation policy requires review; Sequential source itinerary retained; exact times not supplied |

## Preservation and comparison

The before-inventory preserves tour IDs, URLs, titles, original content, SEO metadata, canonicals, images, pricing, source schema and structured records. No audited source files or indexed media were deleted. The private staging version retains noindex protection and original production canonicals.

Representative timed day trips and 2-, 3-, 10- and 15-day circuits all resolve through the same Golden Tour component and style rules. Visual side-by-side approval is still pending; no screenshot-based consistency pass is claimed.

New controls: Admin → Tours → Edit → Booking (ferry and suppliers); Pricing (tier basis); Bookings (passenger status and supplier outbox); customer Account → booking → Passenger details.
