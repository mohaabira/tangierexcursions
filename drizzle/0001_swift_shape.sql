CREATE TABLE `discovery_links` (
	`id` text PRIMARY KEY NOT NULL,
	`tour` text NOT NULL,
	`term` text NOT NULL
);
--> statement-breakpoint
CREATE UNIQUE INDEX `discovery_links_tour_term` ON `discovery_links` (`tour`,`term`);--> statement-breakpoint
CREATE INDEX `discovery_links_term_tour` ON `discovery_links` (`term`,`tour`);--> statement-breakpoint
CREATE TABLE `discovery_terms` (
	`id` text PRIMARY KEY NOT NULL,
	`kind` text NOT NULL,
	`data` text NOT NULL,
	`updated` text NOT NULL
);
--> statement-breakpoint
CREATE INDEX `discovery_terms_kind` ON `discovery_terms` (`kind`);
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-tangier','destination','{"id": "destination-tangier", "kind": "destination", "name": "Tangier", "country": "Morocco", "image": "/wp-content/uploads/2024/03/Tangier-day-trip-from-Seville.jpg", "icon": "map", "description": "", "seoUrl": "/tangier-day-trips/", "visible": true, "featured": true, "order": 0, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "of Chefchaouen, and discover the ancient charm of Tangier—all with the ease of private transport and guided experiences. \n Whet"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": " blue town of Chefchaouen and the vibrant city of Tangier. \n This  private 2-day Morocco tour from Malaga  is ideal for travele"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "ews  \n \n \"An unforgettable experience arranged by Tangier Excursions! Everything was smooth—from the ferry to the camel ride an"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": " alleys in Chefchaouen to the historic kasbahs of Tangier, this is a journey that blends culture, nature, and adventure. \n Whet"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "ng the second in exploring the mysterious city of Tangier with a local tour guide. \n If you are short on time, you may want to "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "uded  \n  Map  \n  Rates  \n  FAQs  \n  Reviews  \n \n \"Tangier Excursions were a wonderful guide to our first entry into Morocco. Fr"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "s you from Spain to Morocco, where you’ll explore Tangier, Chefchaouen, and the beautiful Rif Mountains. From camel rides by th"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "n. In just three days, you can experience vibrant Tangier, the magical blue streets of Chefchaouen, and the stunning landscapes"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "rait of Gibraltar, explore the vibrant culture of Tangier, wander through the enchanting blue streets of Chefchaouen, and exper"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "rivate journey starts with a ferry from Tarifa to Tangier, where you’ll visit Cape Spartel, ride camels on the beach, and explo"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "ain  is ideal to travelers staying in Spain or in Tangier. Morocco is very close to Morocco being only 14.5 Km distance; howeve"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "el From Spain to Morocco in 3 Days / 2 Nights?  \n Tangier is blessed with a strategic location being only 8 miles away from Eur"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": " \n This private 4-day Morocco tour from spain to  Tangier, Fes &amp; Chefchaouen in 4 days/ 3 nights  offers an ideal opportuni"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "p into, cross the Strait of Gibraltar by ferry to Tangier from Tarifa &amp; meet your private driver through his eyes you will "}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "uing on the track to the charming city of Asilah. Tangier is also in the list and few people know how to  taste the mystery of "}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "d exciting ride across the Strait of Gibraltar to Tangier. \n Once in Morocco, your local guide will welcome you and lead you on"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "diz to Morocco day trip  and explore the magic of Tangier in just one day. This seamless experience lets you travel from the hi"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "on it. \n Nestled on the northern coast of Africa, Tangier beckons with its rich history, diverse culture, and stunning coastal "}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "e south of Spain or you may be already staying in Tangier but planning to get most out of this mysterious city.  \n With this ca"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Best Day Trip to Tangier and Asilah  Best Day Trip to Tangier and Asilah \n \n   \n \n   \n \n   \n T"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "Best Tangier and Tetouan Day Trip  Best Tangier and Tetouan Day Trip \n \n   \n \n   \n"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "Private Estepona to Tangier Day Trip  Private Estepona to Tangier Day Trip \n \n   \n \n   \n \n   \n Be"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "rom Spain’s sunny coast to the magical streets of Tangier in just one day. This private experience blends comfort, culture, and"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "Best Day Trip to Tangier from Tarifa, Spain  Best Day Trip to Tangier from Tarifa, Spain \n \n  "}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "trip to Morocco? then, you have come to the right Tangier-based tour operator.  \n Our private Malaga to Tangier day trip is mea"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": " the calm shores of Rota to the exotic rhythms of Tangier in just one day. Cross the Strait of Gibraltar in comfort and step in"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "ant mix of African charm and European elegance in Tangier. This exclusive adventure is perfect for those staying along the Cost"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "Tangier Day Trip from Seville  Tangier Day Trip from Seville \n \n   \n \n   \n \n "}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour  Cultural Tangier Food Tour \n \n   \n \n   \n \n   \n Top-Rated T"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "Best Tangier Guided Walking Tour  Best Tangier Guided Walking Tour \n \n   \n \n   \n \n"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "Private Tangier Shore Excursion  Private Tangier Shore Excursion \n \n   \n \n   \n \n   \n "}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "Tangier to Chefchaouen Day Trip  Tangier to Chefchaouen Day Trip \n \n   \n \n   "}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "? \n   Hassle-free round-trip ferry from Tarifa to Tangier    Private driver waiting for you at the port in Tangier    Scenic dr"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "rtation, fast ferry tickets, and a guided tour in Tangier, this adventure offers a taste of Moroccan culture, history, and char"}, {"path": "/tangier-taxi/tangier-to-chefchaouen-taxi/", "excerpt": "Tangier to Chefchaouen Taxi & Airport Transfers  Tangier to Chefchaouen Taxi "}, {"path": "/tangier-taxi/tangier-to-fes-via-chefchaouen/", "excerpt": "Private Taxi Transfer Tangier To Fes Via Chefchaouen  #content \n #primary \n   Is Tangier Worth Visi"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "Best Private Tangier Airport Taxi Transfers  Reliable &amp; Stress-Free Tangier Airport Ta"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-chefchaouen','destination','{"id": "destination-chefchaouen", "kind": "destination", "name": "Chefchaouen", "country": "Morocco", "image": "/wp-content/uploads/2025/07/Private-Tarifa-to-Chefchaouen-Day-Trip-2.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 1, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "e camels by the beach, explore the blue alleys of Chefchaouen, and discover the ancient charm of Tangier—all with the ease of priva"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "ibraltar and discovering the magical blue town of Chefchaouen and the vibrant city of Tangier. \n This  private 2-day Morocco tour f"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "tic beaches to exploring the magical blue town of Chefchaouen, this trip promises memories that last a lifetime. \n Whether you’re c"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "d in southern Spain. From charming blue alleys in Chefchaouen to the historic kasbahs of Tangier, this is a journey that blends cul"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "private driver before heading to the blue-city of Chefchaouen. \n Spend most of the day meandering around the charming of Medina bef"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "antic Ocean near Tangier  Guided walking tour of  Chefchaouen, the Blue City   Hike through the scenic  Akchour Valley waterfalls  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "m Spain to Morocco, where you’ll explore Tangier, Chefchaouen, and the beautiful Rif Mountains. From camel rides by the Atlantic co"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "ence vibrant Tangier, the magical blue streets of Chefchaouen, and the stunning landscapes of the Rif Mountains. This private adven"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "er, wander through the enchanting blue streets of Chefchaouen, and experience the natural beauty of the Akchour Valley. \n This  pri"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": " and explore the Hercules Caves before heading to Chefchaouen for a guided tour and overnight in a Riad. \n On Day 2, enjoy a hike t"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "ers Tangier, Asilah, Rabat, Meknes, and Fes &amp; Chefchaouen. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULTURAL\n100%\n\n\n\n\n\n\n\n\nPRIVATE\n100%\n\n\n\n\n"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": " Asilah  and the immesely beautiful bleu city of  Chefchaouen . \n   \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULTURAL\n100%\n\n\n\n\n\n\n\n\nPRIVATE\n100%"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "ay Morocco tour from spain to  Tangier, Fes &amp; Chefchaouen in 4 days/ 3 nights  offers an ideal opportunity to learn about the e"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "city of Asilah, the beautifully blue-hued city of Chefchaouen, the Roman capital of Volubilis, the French Versaille city of Meknes,"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": " Fes &amp; Marrakech along with the blue town of  Chefchaouen , the Roman Ruins of Volubilis, Sahara Desert, valleys, canyons, Atla"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "the intricate streets of the blue-painted town of Chefchaouen. \n 5.0 \n \n \n \n  \n \n \n \n \n  \n \n \n \n \n  \n \n \n \n \n  \n \n \n \n   Highlights"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "Tangier to Chefchaouen Day Trip  Tangier to Chefchaouen Day Trip \n \n   \n \n   \n \n   \n Top-Rat"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "Tarifa to Chefchaouen Day Trip  Tarifa to Chefchaouen Day Trip \n \n   \n \n   \n \n   \n Private "}, {"path": "/tangier-taxi/tangier-to-chefchaouen-taxi/", "excerpt": "Tangier to Chefchaouen Taxi & Airport Transfers  Tangier to Chefchaouen Taxi &amp; Airport T"}, {"path": "/tangier-taxi/tangier-to-fes-via-chefchaouen/", "excerpt": "Private Taxi Transfer Tangier To Fes Via Chefchaouen  #content \n #primary \n   Is Tangier Worth Visiting? A Journey into th"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "irport ----&gt; Asilah \n Tangier Airport ----&gt; Chefchaouen \n Tangier Airport ----&gt; Tetouan \n Tangier Airport ----&gt; Fes \n F"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-asilah','destination','{"id": "destination-asilah", "kind": "destination", "name": "Asilah", "country": "Morocco", "image": "/wp-content/uploads/2019/03/Medina-Asilah-Morocco-11-Edit.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 2, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "private tour of Morocco in 5 days covers Tangier, Asilah, Rabat, Meknes, and Fes &amp; Chefchaouen. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURE"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "ing on for the short break tour that would cover  Asilah  and the immesely beautiful bleu city of  Chefchaouen . \n   \n GUIDED\n"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": " mysterious city of Tangier, the artistic city of Asilah, the beautifully blue-hued city of Chefchaouen, the Roman capital of "}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "e continuing on the track to the charming city of Asilah. Tangier is also in the list and few people know how to  taste the my"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Best Day Trip to Tangier and Asilah  Best Day Trip to Tangier and Asilah \n \n   \n \n   \n \n   \n Top-Rated Da"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": " ----&gt; City Center  \n Tangier Airport ----&gt; Asilah \n Tangier Airport ----&gt; Chefchaouen \n Tangier Airport ----&gt; Tet"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-tetouan','destination','{"id": "destination-tetouan", "kind": "destination", "name": "Tetouan", "country": "Morocco", "image": "/wp-content/uploads/2019/03/Tetouan-Morocco.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 3, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "dalusian and UNESCO Heritage World Site Medina of Tetouan before spending a full day meandering around the intricate streets of"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "Best Tangier and Tetouan Day Trip  Best Tangier and Tetouan Day Trip \n \n   \n \n   \n \n   \n Top-R"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "t ----&gt; Chefchaouen \n Tangier Airport ----&gt; Tetouan \n Tangier Airport ----&gt; Fes \n From €25 \n From €65 \n From €110 \n Fr"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-fes','destination','{"id": "destination-fes", "kind": "destination", "name": "Fes", "country": "Morocco", "image": "/wp-content/uploads/2025/08/3-Day-Morocco-Tour-from-Malaga.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 4, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "5 days covers Tangier, Asilah, Rabat, Meknes, and Fes &amp; Chefchaouen. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULTURAL\n100%\n\n\n\n\n\n\n\n"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "rivate 4-day Morocco tour from spain to  Tangier, Fes &amp; Chefchaouen in 4 days/ 3 nights  offers an ideal opportunity to"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "ersaille city of Meknes, the spiritual capital of Fes, the majestic Sahara Desert, Atlas Mountains, canyons, Valleys, Kasba"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "vers the  Imperial Cities , namely Rabat, Meknes, Fes &amp; Marrakech along with the blue town of  Chefchaouen , the Roman "}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "Trip Detailed Itinerary \n The alluring Meknes and Fes, former Imperial Capitals of Morocco cannot fail to haunt the souls o"}, {"path": "/tangier-taxi/tangier-to-fes-via-chefchaouen/", "excerpt": "Private Taxi Transfer Tangier To Fes Via Chefchaouen  #content \n #primary \n   Is Tangier Worth Visiting? A"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "rport ----&gt; Tetouan \n Tangier Airport ----&gt; Fes \n From €25 \n From €65 \n From €110 \n From €85 \n From €175 \n Why Book Y"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-rabat','destination','{"id": "destination-rabat", "kind": "destination", "name": "Rabat", "country": "Morocco", "image": "/wp-content/uploads/2019/03/rabat.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 5, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "tour of Morocco in 5 days covers Tangier, Asilah, Rabat, Meknes, and Fes &amp; Chefchaouen. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULT"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "orocco Tour  covers the  Imperial Cities , namely Rabat, Meknes, Fes &amp; Marrakech along with the blue town of  Chefchaouen"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": " Morocco, then head further north while exploring Rabat, which is the  UNESCO listed  and the current administrative capital "}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-casablanca','destination','{"id": "destination-casablanca", "kind": "destination", "name": "Casablanca", "country": "Morocco", "image": "/wp-content/uploads/2019/03/best-ofmorocco-pic.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 6, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "ely cultural, private &amp; affordable. Arrive at Casablanca International Airport or wherever in Morocco, we efficiently customiz"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "/ 14 Nights \n  Meet &amp; Greet at the Airport of Casablanca  Visit the impressive Hassan II Mosque  Explore Oudayas Kasbah, Moham"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-marrakech','destination','{"id": "destination-marrakech", "kind": "destination", "name": "Marrakech", "country": "Morocco", "image": "/wp-content/uploads/2019/03/rabat.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 7, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "sert, Atlas Mountains, canyons, Valleys, Kasbahs, Marrakesh and much more. \n Leave a Replay \n About Us \n At Tangier Excursions, w"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "Imperial Cities , namely Rabat, Meknes, Fes &amp; Marrakech along with the blue town of  Chefchaouen , the Roman Ruins of Volubil"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS  MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHT"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS  OVREVIEW \n Why Should You Book Private"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "yons, Kasbah and Ksers  Have a guided tour around Marrakech “ Pearl of the South”     Itinerary  \n Morocco Trip Detailed Itinerar"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-merzouga','destination','{"id": "destination-merzouga", "kind": "destination", "name": "Merzouga", "country": "Morocco", "image": "/wp-content/uploads/2019/03/jessica-arias-1275829-unsplash.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 8, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "m afar to the oasis. Drive through the village of Merzouga to the Khamlia Village where most the inhabitants are originally slav"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "e included).  \n  DAY3: ZAGORA  – NKOB – RISSANI – MERZOUGA  \n After having breakfast in your Riad, your  Marrakech desert trip  "}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "DAY 7: FES - MIDDLE ATLAS - MIDELT - ZIZ VALLEY - MERZOUGA DESERT \n After having breakfast in your Riad, you will head to the Sa"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-sahara','destination','{"id": "destination-sahara", "kind": "destination", "name": "Sahara", "country": "Morocco", "image": "/wp-content/uploads/2019/05/morocco-desert11.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 9, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "eknes, the spiritual capital of Fes, the majestic Sahara Desert, Atlas Mountains, canyons, Valleys, Kasbahs, Marrakesh and muc"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "n of  Chefchaouen , the Roman Ruins of Volubilis, Sahara Desert, valleys, canyons, Atlas Mountains, and much more. You will ha"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "u will explore this magical city and the alluring Sahara Desert. Transfer to your Riad in the Medina (Old Town) of Marrakech w"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "tic deserts that form a good portion of the Great Sahara. The desert of Morocco is divided into  Erg  Chebbi &amp; Erg Chegaga"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "sis before embarking on a lifetime journey in the Sahara Desert on a camel and spend the night under the stars in the heart of"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('destination-essaouira','destination','{"id": "destination-essaouira", "kind": "destination", "name": "Essaouira", "country": "Morocco", "image": "/wp-content/uploads/2019/04/desert.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 10, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "; breakfast accommodation.  \n DAY 13: MARRAKECH - ESSAOUIRA \n After having breakfast in your Riad/Hotel, you may want to spend th"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-tangier','origin','{"id": "origin-tangier", "kind": "origin", "name": "Tangier", "country": "Morocco", "image": "/wp-content/uploads/elementor/thumbs/Grand-Mosque-Tangier-r1vun0bqytrgcbfgx1avwn2wex05cjsy0jh7wfduuo.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 11, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Best Day Trip to Tangier and Asilah day-trip-to-tangier-and-asilah"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "Best Tangier and Tetouan Day Trip day-trip-to-tangier-and-tetouan-from-gibraltar"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour tangier-food-tour"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "Best Tangier Guided Walking Tour tangier-guided-walking-tour"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "Private Tangier Shore Excursion tangier-shore-excursion"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "Tangier to Chefchaouen Day Trip tangier-to-chefchaouen-day-trip"}, {"path": "/tangier-taxi/tangier-to-chefchaouen-taxi/", "excerpt": "Tangier to Chefchaouen Taxi & Airport Transfers tangier-to-chefchaouen-taxi"}, {"path": "/tangier-taxi/tangier-to-fes-via-chefchaouen/", "excerpt": "Private Taxi Transfer Tangier To Fes Via Chefchaouen tangier-to-fes-via-chefchaouen"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "Best Private Tangier Airport Taxi Transfers tangier-airport-taxi"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-marrakech','origin','{"id": "origin-marrakech", "kind": "origin", "name": "Marrakech", "country": "Morocco", "image": "/wp-content/uploads/2019/03/jessica-arias-1275829-unsplash.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 12, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS marrakech-desert-tour"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS marrakech-desert-trip-7-days-6-nights"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-tarifa','origin','{"id": "origin-tarifa", "kind": "origin", "name": "Tarifa", "country": "Spain", "image": "/wp-content/uploads/2025/08/3-Day-Morocco-Tour-from-Tarifa.jpg", "icon": "map", "description": "", "seoUrl": "/tarifa-to-morocco-tours/", "visible": true, "featured": true, "order": 13, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "3 Day Morocco tour from Tarifa 3-day-morocco-tour-from-tarifa"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "Best Day Trip to Tangier from Tarifa, Spain full-day-trip-to-tangier-from-tarifa-spain"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "Tarifa to Chefchaouen Day Trip tarifa-to-chefchaouen-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-seville','origin','{"id": "origin-seville", "kind": "origin", "name": "Seville", "country": "Spain", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Seville.jpg", "icon": "map", "description": "", "seoUrl": "/seville-to-morocco-tours/", "visible": true, "featured": true, "order": 14, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "2-Day Trip to Morocco from Seville 2-day-trip-to-morocco-from-seville"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "3 Day Morocco tour from Seville 3-day-morocco-tour-from-seville"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "Tangier Day Trip from Seville tangier-day-trip-from-seville"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-malaga','origin','{"id": "origin-malaga", "kind": "origin", "name": "Málaga", "country": "Spain", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Malaga.jpg", "icon": "map", "description": "", "seoUrl": "/malaga-to-morocco-tours/", "visible": true, "featured": true, "order": 15, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "2-Day Trip to Morocco from Malaga 2-day-trip-to-morocco-from-malaga"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "3 Day Morocco tour from Malaga 3-day-morocco-tour-from-malaga"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "Luxury Malaga Day Trip to Morocco malaga-day-trip-to-morocco"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-marbella','origin','{"id": "origin-marbella", "kind": "origin", "name": "Marbella", "country": "Spain", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Marbella-1.jpg", "icon": "map", "description": "", "seoUrl": "/marbella-to-morocco-tours/", "visible": true, "featured": true, "order": 16, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "2-Day Trip to Morocco from Marbella 2-day-trip-to-morocco-from-marbella"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "3 Day Morocco tour from Marbella 3-day-morocco-tour-from-marbella"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "Day Trip from Marbella to Morocco day-trip-from-marbella-to-morocco"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-estepona','origin','{"id": "origin-estepona", "kind": "origin", "name": "Estepona", "country": "Spain", "image": "/wp-content/uploads/2024/11/Estepona-to-Tangier-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 17, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "Private Estepona to Tangier Day Trip estepona-to-tangier-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-cadiz','origin','{"id": "origin-cadiz", "kind": "origin", "name": "Cádiz", "country": "Spain", "image": "/wp-content/uploads/2025/07/Private-Cadiz-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 18, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "Cadiz to Morocco Day Trip cadiz-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-gibraltar','origin','{"id": "origin-gibraltar", "kind": "origin", "name": "Gibraltar", "country": "Gibraltar", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "map", "description": "", "seoUrl": "/gibraltar-to-morocco-tours/", "visible": true, "featured": true, "order": 19, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "2-Day Trip to Morocco from Gibraltar 2-day-trip-to-morocco-from-gibraltar"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "3 Day Morocco tour from Gibraltar 3-day-morocco-tour-from-gibraltar"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "uan Day Trip day-trip-to-tangier-and-tetouan-from-gibraltar"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-benalmadena','origin','{"id": "origin-benalmadena", "kind": "origin", "name": "Benalmádena", "country": "Spain", "image": "/wp-content/uploads/2025/07/Benalmadena-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 20, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "Benalmadena to Morocco Day Trip benalmadena-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-torremolinos','origin','{"id": "origin-torremolinos", "kind": "origin", "name": "Torremolinos", "country": "Spain", "image": "/wp-content/uploads/2025/07/Torremolinos-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 21, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "Torremolinos to Morocco Day Trip torremolinos-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-fuengirola','origin','{"id": "origin-fuengirola", "kind": "origin", "name": "Fuengirola", "country": "Spain", "image": "/wp-content/uploads/2025/07/Fuengirola-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 22, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "Fuengirola to Morocco Day Trip fuengirola-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-rota','origin','{"id": "origin-rota", "kind": "origin", "name": "Rota", "country": "Spain", "image": "/wp-content/uploads/2025/07/Private-Rota-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 23, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "Rota to Morocco Day Trip rota-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-sotogrande','origin','{"id": "origin-sotogrande", "kind": "origin", "name": "Sotogrande", "country": "Spain", "image": "/wp-content/uploads/2025/07/Private-Sotogrande-to-Morocco-Day-Trip.jpg", "icon": "map", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 24, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "Sotogrande to Morocco Day Trip sotogrande-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-private-day-trips','type','{"id": "type-private-day-trips", "kind": "type", "name": "Private Day Trips", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "/tangier-day-trips/", "visible": true, "featured": true, "order": 25, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "Benalmadena to Morocco Day Trip benalmadena-to-morocco-day-trip"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "Cadiz to Morocco Day Trip cadiz-to-morocco-day-trip"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "Day Trip from Marbella to Morocco day-trip-from-marbella-to-morocco"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "Luxury Day Trip to Morocco from Spain day-trip-to-morocco-from-spain"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Best Day Trip to Tangier and Asilah day-trip-to-tangier-and-asilah"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "Best Tangier and Tetouan Day Trip day-trip-to-tangier-and-tetouan-from-gibraltar"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "Private Estepona to Tangier Day Trip estepona-to-tangier-day-trip"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "Fuengirola to Morocco Day Trip fuengirola-to-morocco-day-trip"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "Best Day Trip to Tangier from Tarifa, Spain full-day-trip-to-tangier-from-tarifa-sp"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "Luxury Malaga Day Trip to Morocco malaga-day-trip-to-morocco"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "Rota to Morocco Day Trip rota-to-morocco-day-trip"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "Sotogrande to Morocco Day Trip sotogrande-to-morocco-day-trip"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "Tangier Day Trip from Seville tangier-day-trip-from-seville"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "Tangier to Chefchaouen Day Trip tangier-to-chefchaouen-day-trip"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "Tarifa to Chefchaouen Day Trip tarifa-to-chefchaouen-day-trip"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "Torremolinos to Morocco Day Trip torremolinos-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-short-morocco-trips','type','{"id": "type-short-morocco-trips", "kind": "type", "name": "Short Morocco Trips", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "/best-tangier-tours/", "visible": true, "featured": true, "order": 26, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "2-Day Trip to Morocco from Gibraltar 2-day-trip-to-morocco-from-gibraltar"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "2-Day Trip to Morocco from Malaga 2-day-trip-to-morocco-from-malaga"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "2-Day Trip to Morocco from Marbella 2-day-trip-to-morocco-from-marbella"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "2-Day Trip to Morocco from Seville 2-day-trip-to-morocco-from-seville"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "2 Day Trip to Morocco from Spain 2-day-trip-to-morocco-from-spain"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "3 Day Morocco tour from Gibraltar 3-day-morocco-tour-from-gibraltar"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "3 Day Morocco tour from Malaga 3-day-morocco-tour-from-malaga"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "3 Day Morocco tour from Marbella 3-day-morocco-tour-from-marbella"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "3 Day Morocco tour from Seville 3-day-morocco-tour-from-seville"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "3 Day Morocco tour from Tarifa 3-day-morocco-tour-from-tarifa"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "PRIVATE 5 DAY MOROCCO TOUR FROM SPAIN 5-day-morocco-tour-from-spain"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "TRAVEL FROM SPAIN TO MOROCCO 3 DAYS / 2 NIGHTS travel-from-spain-to-morocco"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "4-Day Morocco Tour from Spain trip-tangier-to-fes-chefchaouen-4-days-3-nigh"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-multi-day-morocco-tours','type','{"id": "type-multi-day-morocco-tours", "kind": "type", "name": "Multi-Day Morocco Tours", "country": "", "image": "/wp-content/uploads/2019/05/morocco-desert11.jpg", "icon": "compass", "description": "", "seoUrl": "/morocco-vacation-packages/", "visible": true, "featured": true, "order": 27, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "Morocco Desert Trip From Spain 11 D / 10 N morocco-desert-trip-from-spain"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "BEST PRIVATE MOROCCO TOUR 10 DAYS / 9 NIGHTS best-private-morocco-tour-10-days-9-nights"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS marrakech-desert-tour"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS marrakech-desert-trip-7-days-6-nights"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "Morocco Trip 15 Days/14 Nights morocco-trip-15-days-14-nights"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-shore-excursions','type','{"id": "type-shore-excursions", "kind": "type", "name": "Shore Excursions", "country": "", "image": "/wp-content/uploads/2020/03/main-1.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 28, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "Private Tangier Shore Excursion tangier-shore-excursion"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-desert-tours','type','{"id": "type-desert-tours", "kind": "type", "name": "Desert Tours", "country": "", "image": "/wp-content/uploads/2019/05/morocco-desert11.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 29, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "Morocco Desert Trip From Spain 11 D / 10 N morocco-desert-trip-from-spain"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS marrakech-desert-tour"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS marrakech-desert-trip-7-days-6-nights"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-city-tours','type','{"id": "type-city-tours", "kind": "type", "name": "City Tours", "country": "", "image": "/wp-content/uploads/2022/01/Untitled-design-2022-01-16T171038.955.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 30, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour tangier-food-tour"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "Best Tangier Guided Walking Tour tangier-guided-walking-tour"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('type-private-transfers','type','{"id": "type-private-transfers", "kind": "type", "name": "Private Transfers", "country": "", "image": "/wp-content/uploads/2020/03/chef1.jpg", "icon": "compass", "description": "", "seoUrl": "/tangier-taxi/", "visible": true, "featured": true, "order": 31, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-taxi/tangier-to-chefchaouen-taxi/", "excerpt": "Tangier to Chefchaouen Taxi & Airport Transfers tangier-to-chefchaouen-taxi"}, {"path": "/tangier-taxi/tangier-to-fes-via-chefchaouen/", "excerpt": "Private Taxi Transfer Tangier To Fes Via Chefchaouen tangier-to-fes-via-chefchaoue"}, {"path": "/taxi-transfers/tangier-airport-taxi/", "excerpt": "Best Private Tangier Airport Taxi Transfers tangier-airport-taxi"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-culture','activity','{"id": "activity-culture", "kind": "activity", "name": "Culture", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 32, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "rom Gibraltar  is the perfect blend of adventure, culture, and scenic beauty. In just two days, you’ll cross continents, ride "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "or an unforgettable experience that blends exotic culture, stunning landscapes, and authentic traditions, this  2-day trip to "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "arbella? \n If you’re looking for an unforgettable cultural escape just across the sea, this  2-day trip to Morocco from Marbel"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "kasbahs of Tangier, this is a journey that blends culture, nature, and adventure. \n Whether you’re exploring with friends, fam"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "Learn the rich history of Tangier  Meet the local culture and lifestyle on their own terms  Immerse in the culture through exp"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "raltar  is the perfect way to experience Moroccan culture, landscapes, and traditions in just three days. With seamless transf"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "ded tours of historic medinas, this tour combines culture, adventure, and comfort in one unforgettable experience. \n This  pri"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "untains. This private adventure combines comfort, culture, and convenience, making it one of the most popular short trips from"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "ross the Strait of Gibraltar, explore the vibrant culture of Tangier, wander through the enchanting blue streets of Chefchaoue"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "is  trip from Tarifa to Morocco in 3 days  blends culture, nature, and comfort. Other options include a  3 Day Morocco tour fr"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "an excellent opportunity to learn about an exotic culture that has been preserved throughout history. You will notice that eve"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": " and you will notice how completely different the culture.  Travel from Spain to Morocco in 3 days / 2 nights  can certainly o"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "rs an ideal opportunity to learn about the exotic culture of Morocco in a short period of time. You may be already exploring S"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "vel experts to offer you a great insight into the culture &amp; unique lifestyle of Moroccans. Morocco is the closest gateway "}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "tunity to get most of Morocco. The tour is purely cultural, private &amp; affordable. Arrive at Casablanca International Airpo"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": " illuminating stars. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULTURAL\n100%\n\n\n\n\n\n\n\n\nPRIVATE\n100%\n\n\n\n\n\n\n\n\nADEQUATE FOR ALLAGES\n100% \n  \n \n "}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "lleys and much more. \n GUIDED\n100%\n\n\n\n\n\n\n\n\nPURELY CULTURAL\n100%\n\n\n\n\n\n\n\n\nPRIVATE\n100%\n\n\n\n\n\n\n\n\nADEQUATE FOR ALLAGES\n100% \n  \n \n "}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "aiming, therefore, to clear the ground for unique cultural immersions while enjoying the breathtaking views that Morocco has t"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "oy a traditional Moroccan lunch, take in the rich culture, and even hop on a short camel ride before heading back. This privat"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "ther side. \n Whether you’re a curious traveler, a culture enthusiast, or simply looking for something new to add to your Spain"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "rocco, Spain through which you will meet the true culture of Moroccans.  \n Your private driver will pick you up from the addre"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "he Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own terms  Wander around the Kasbah &amp; Med"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "g to spend the day out exploring a new and exotic culture. You will be guided around the Kasbah &amp; Medina of Tangier as wel"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "the available opportunity to experience an intact culture. \n Tangier served as the international zone from 1920th to 1950th be"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "he Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own terms  Wander around the Kasbah &amp; Med"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": " one day. This private experience blends comfort, culture, and convenience, perfect for those staying in Fuengirola who wish t"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "cellent opportunity to learn about the enchanting culture of Morocco. Whether you are in Spain and want to opt for this unique"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "trip is meant to allow you to immerse in the true culture of Morocco as we intimately know it. Your private tour guide has the"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": " Trip \n If you’re looking to add an unforgettable cultural twist to your holiday in southern Spain, our  private Rota to Moroc"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "to offer you a smooth, comfortable, and immersive cultural journey. From pickup at your doorstep in Sotogrande to camel rides "}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": " offers an unforgettable experience that combines culture, history, and adventure.  \n Imagine immersing yourself in the allure"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour  Cultural Tangier Food Tour \n \n   \n \n   \n \n   \n T"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "llow you to immerse and engage in the deep-seated culture of Morocco. \n Whether you are in Spain and planning to join one of o"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "er cruise passengers a taste of Morocco’s vibrant culture, history, and natural beauty in a short time frame. Here’s what you "}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": " dock of Tangier and will be given an interesting cultural walking of the Medina (Old Town) of Chefchaouen by a local tour gui"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "p from Tarifa to Chefchaouen  blends convenience, culture, and natural beauty. Your journey includes a scenic drive across nor"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "angier, this adventure offers a taste of Moroccan culture, history, and charm — all without the need for an overnight stay. \n "}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-sightseeing','activity','{"id": "activity-sightseeing", "kind": "activity", "name": "Sightseeing", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 33, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing; this tour is relaxed and immersive  \n  Looking for other options? Yo"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing; this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing; this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing; this tour is relaxed and immersive  \n  Is the Tour Family-Friendly? "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "through exploring the Kasbah &amp; Medina  Have a sightseeing tour around Tangier including the promontory Cap Spartel, Hercules Ca"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": " &amp; greet upon arrival at the port of Tangier  Sightseeing tour around Tangier including the Ville Nouvelle, Cap Spartel &amp; H"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "alking and steps  Travelers who prefer fast-paced sightseeing, this tour is relaxed and immersive  "}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "tanding. You will first embark for an interesting sightseeing tour around the Ville Nouvelle of Marrakech that was built by the Fre"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "dedication from Jacque Majorelle to create. \n The sightseeing tour of Marrakech will include a visit to the Menara Gardens with its"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "– Bed &amp; breakfast option.  \n  DAY7: MARRAKECH SIGHTSEEING TOUR &amp; TRANSFER TO THE AIRPORT  \n After breakfast in your Riad, i"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "angier  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "c Tangier and Asilah. Begin your journey with the sightseeing tour around Tangier by driving through the Ville Nouvelle (New Town) "}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for break at the Cape Spartel Prom"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "at the port, hotel or wherever in Tangier  Have a sightseeing tour around Tangier including the Cape Spartel &amp; Hercules Caves  "}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "angier  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "cco from Spain  offering an opportunity to have a sightseeing tour around the city by visiting the Spartel Cape promontory, the pre"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "ngier.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "guide.  Learn the rich history of Tangier  Have a sightseeing tour around Tangier  A short pause for relaxation at the Cape Spartel"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-food-experiences','activity','{"id": "activity-food-experiences", "kind": "activity", "name": "Food Experiences", "country": "", "image": "/wp-content/uploads/2022/10/Untitled-design-2022-10-15T183653.049.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 34, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "p to Tangier from Tarifa , Spain, or the  Tangier food tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "p to Tangier from Tarifa , Spain, or the  Tangier food tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": " day trip to Morocco from Spain , or the  Tangier food tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour  Cultural Tangier Food Tour \n \n   \n \n   \n \n   \n Top-Rated Tangier Foo"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "p to Tangier from Tarifa , Spain, or the  Tangier food tour .  Please note that once you submit your booking form, we will subseq"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-camel-rides','activity','{"id": "activity-camel-rides", "kind": "activity", "name": "Camel Rides", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 35, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "and relaxed vibe. The riad was beautiful, and the camel ride along the beach was such a fun touch. Highly recommend this tour if "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "ions! Everything was smooth—from the ferry to the camel ride and exploring Chefchaouen. The Riad stay was lovely, and our guides "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": " heart of Morocco’s most fascinating cities. From camel rides on Atlantic beaches to exploring the magical blue town of Chefchaou"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "uen and walking through Tangier’s old medina. The camel ride and the Riad stay were highlights. It was the perfect mix of culture"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": " promontory Cap Spartel, Hercules Caves..  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Kasbah Mus"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "el , where the Atlantic meets the Mediterranean   Camel ride  by the Atlantic Ocean near Tangier  Guided walking tour of  Chefcha"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "hefchaouen, and the beautiful Rif Mountains. From camel rides by the Atlantic coast to guided tours of historic medinas, this tou"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "s you to explore iconic landmarks, enjoy a guided camel ride by the Atlantic coast, and wander through colorful souks and medinas"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": " three days, you’ll explore Cape Spartel, enjoy a camel ride on the beach, visit the “Blue Pearl” of Chefchaouen, hike the scenic"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "arifa to Tangier.  Visit Cape Spartel and enjoy a camel ride by the beach.  Explore the legendary Hercules Caves.  Guided tour of"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": " Atlantic Coastline but we may include a time for camel ride experience by the sandy beach if you feel you like it. \n Asilah is y"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "e Atlantic Coastline where we will experience the camel ride by the sandy beach. Visit the Hercules Caves that go back to the Neo"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "were all incredible, each with its own charm. The camel ride by the beach and walking through the old medinas were unforgettable "}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "tch your legs at the Todra Gorges  Experience the camel ride in the desert and spend the night under the stars in the heart of th"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "rove valley of Draa &amp; Zagora.  Experience the camel ride in the desert and spend the night under the stars in the heart of th"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "take in the rich culture, and even hop on a short camel ride before heading back. This private day trip offers a seamless, person"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "elaxation at the Cape Spartel Promontory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Prehistori"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "elaxation at the Cape Spartel Promontory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Pre-histor"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "ssional English speaking, private tour guide; the camel ride experience by the sandy beach of the Atlantic to a surprisingly Moro"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "an Sea converge. It is possible to experience the camel ride by the sandy beach or take pictures before continuing on the track t"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "views. After that, you may want to experience the camel ride by the sandy beach before making a visit to the pre-historic Hercule"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "for break at the Cape Spartel Promontory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Pre-histor"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "d our guide was so knowledgeable of the city. the camel ride was amazing and we also got to pet some baby camels. everything went"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "Cape Spartel &amp; Hercules Caves  Experience the camel ride  Learn the rich history of Tangier  Meet the local culture and lifes"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "elaxation at the Cape Spartel Promontory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Pre-histor"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "rious travelers who crave authentic moments. From camel rides on the beach to the colorful souks of Tangier, you’ll explore vibra"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "ey. From pickup at your doorstep in Sotogrande to camel rides on the beach and wandering through the bustling Medina of Tangier, "}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": ", preparing you for the wonders that lie ahead. \n Camel Ride by the Atlantic: A Taste of the Exotic \n Embrace an exhilarating cam"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "historic Caves of Hercules &amp; experiencing the camel ride by the Atlantic shoreline. \n    Important Information \n  The Tangier"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": ", guiding ships through the treacherous waters. \n Camel Ride Experience by the Atlantic Shore: \n Prepare for a unique and memorab"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "elaxation at the Cape Spartel Promontory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Prehistori"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-desert-experiences','activity','{"id": "activity-desert-experiences", "kind": "activity", "name": "Desert Experiences", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Marbella-1.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 36, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "e iconic locations like  Cape Spartel , the beach dunes on camelback, and the picture-perfect blue alleys of Chefchaouen.   D"}, {"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "Morocco Desert Trip From Spain 11 D / 10 N  Best Private Desert Trip to Morocco From"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "hefchaouen , the Roman Ruins of Volubilis, Sahara Desert, valleys, canyons, Atlas Mountains, and much more. You will have an i"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS  MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS \n  \n"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS  OVREVIEW \n Why Should You Book Private Marrak"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "city of Chefchaouen  Camel trek &amp; explore the desert area  Visit the canyons, Kasbah and Ksers  Have a guided tour around "}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": " - we enjoyed ourselves so much around the Sahara Desert. Because Moha is such a friendly and easy-going tour guide, we had ou"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-walking-tours','activity','{"id": "activity-walking-tours", "kind": "activity", "name": "Walking Tours", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 37, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "d tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour of Tangier’s Kasbah and Medina  Overnight stay in a traditional Moroc"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "d tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour of Tangier’s Kasbah and Medina  Overnight stay in a traditional Moroc"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "d tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour of Tangier’s Kasbah and Medina  Overnight stay in a traditional Moroc"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "d tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour of Tangier’s Kasbah and Medina  Overnight stay in a traditional Moroc"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "hic Hercules Caves. Later, you will have a guided walking tour of the Kasbah &amp; the Medina with its Souks and streets that are sh"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": " ride  by the Atlantic Ocean near Tangier  Guided walking tour of  Chefchaouen, the Blue City   Hike through the scenic  Akchour Val"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "joy a  camel ride by the Atlantic coast .  Guided walking tour of  Chefchaouen , the Blue City.  Scenic hike in the  Akchour Valley "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "nean  Camel ride along the Atlantic beach  Guided walking tour of  Chefchaouen, the Blue Pearl   Hike in the beautiful  Akchour Vall"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "ke in the breathtaking Valley of Akchour.  Guided walking tour of Tangier’s Medina and Kasbah.  Comfortable overnight stays in charm"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "er for an overnight stay. Day 3 includes a guided walking tour of Tangier’s Medina and Kasbah before taking the ferry back to Tarifa"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "ouvelle, Cap Spartel &amp; Hercules Caves  Guided walking tour of the Kasbah &amp; Medina  Visit the Souks &amp; come to terms with "}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "ng the Atlantic Coastline and will include a nice walking tour around this tranquil gem of a town. The first eye-catching attraction"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": " From camel rides on the Atlantic coast to guided walking tours in UNESCO-listed  medinas , this  trip from Spain to Morocco in 4 da"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": ", but you find yourself within a live museum. Our walking tour will take us through the blue painted narrow alleyways to reach the f"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "wland of Marrakech. \n Embark on a purely cultural walking tour of Marrakech from the Mosque of La Koutoubia that was built by the Al"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "s witnessed great transformation over time. \n The walking tour will begin at the Koutoubia Mosque, which is the landmark of this bea"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "ASABLANCA – RABAT – ASILAH - TANGIER \n Begin your walking tour from the Oudayas Kasbah (small fortress) that was built initially by "}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "thic Hercules Caves. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Your Tangier day trip from Benalmadena will include a guided tour "}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "ith legendary roots. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Next, leave the car behind and dive into Tangier’s rich culture wi"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "thin these hallowed walls. \n  KASBAH &amp; MEDINA WALKING TOUR  \n Your extraordinary day trip from Marbella to Morocco will allow yo"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "ngier from Tarifa , Spain, or the  Tangier guided walking tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "es that date back to the Neolithic Era. \n  Guided Walking Tour of the Kasbah &amp; Medina  \n Drive back to the Kasbah for an interes"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "sit to the pre-historic Hercules Caves. \n  Guided Walking Tour of the Kasbah &amp; Medina  \n The second part of our guided tour of T"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "e Kasbah and Medina for your interesting cultural walking tour. \n  EXPLORE THE KASBAH &amp; THE MEDINA OF TANGIER  \n Drive back to t"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "al mystery and myth. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Follow your guide through the Kasbah’s majestic gates and into the"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "from Spain will reward you with a purely cultural walking tour of the Kasbah which is located uphill. You will walk through its intr"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "ngier from Tarifa , Spain, or the  Tangier guided walking tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": " and natural beauty. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Next, step into Tangier’s Old Town for a guided walk through the  "}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": " and natural beauty. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Step into Tangier’s old city for a guided walking tour through the"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "steries of time, just like your journey itself. \n Walking Tour of the Kasbah: A Journey Through Time \n Next on your itinerary is the"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "ngier from Tarifa , Spain, or the  Tangier guided walking tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "Best Tangier Guided Walking Tour  Best Tangier Guided Walking Tour \n \n   \n \n   \n \n   \n Top-Rated Tangi"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "delights of traditional cuisine. \n As your guided walking tour winds through these historic neighborhoods, you’ll be transported bac"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "ip to Morocco from Spain , or the  Tangier guided walking tour .  Please note that once you submit your booking form, we will subseq"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": " a scenic drive across northern Morocco, a guided walking tour of Chefchaouen, and enough free time to relax, shop, and take incredi"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "thology and history. \n  NOON: KASBAH &amp; MEDINA WALKING TOUR  \n Delve into Tangier’s rich heritage with a walking tour through the"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-historical-sites','activity','{"id": "activity-historical-sites", "kind": "activity", "name": "Historical Sites", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Malaga.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 38, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "ngier walking tour   through the old Kasbah , the historic Medina, and vibrant souks. You’ll have time to learn about Moroccan c"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": ". From charming blue alleys in Chefchaouen to the historic kasbahs of Tangier, this is a journey that blends culture, nature, an"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "el rides by the Atlantic coast to guided tours of historic medinas, this tour combines culture, adventure, and comfort in one un"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": ". Discover its vibrant souks, narrow streets, and historic landmarks before your guide escorts you back to the port. Board the f"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "h century and the site of  Lixus  witnesses these historical facts. \n You will continue on the track along the Atlantic to Rabat"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "the 15th century by the Portuguese present a nice historical character to this charming town, and are spectacular. \n After lunch"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "Kasbah and Medina . Wander through narrow alleys, historic squares, and lively markets before settling into a  charming riad in "}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "th century. You tour guide will shed light on the historical background behind the foundation of Marrakech as a whole and how it"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "erranean and the Atlantic Ocean meet, and the pre-historic Hercules Caves before embarking on a nice  Tangier guided walking tou"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "rough the vibrant streets of Tangier. Explore the historic Kasbah, wander through the colorful Medina, and visit iconic sites li"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "This seamless experience lets you travel from the historic streets of Cadiz to the colorful souks and Atlantic beaches of Morocc"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "y the sandy beach of the Atlantic.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "on at the Cape Spartel Promontory.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": " the sandy beach before making a visit to the pre-historic Hercules Caves. \n  Guided Walking Tour of the Kasbah &amp; Medina  \n "}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "y the sandy beach of the Atlantic.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "by the sandy beach of the Atlantic.  Visit the Prehistoric Caves of Hercules  Meet the local culture and lifestyle on their term"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "y the sandy beach of the Atlantic.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "by the sandy beach of the Atlantic.  Visit the Prehistoric Caves of Hercules  Meet the local culture and lifestyle on their term"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "by the sandy beach of the Atlantic.  Visit the Prehistoric Caves of Hercules  Meet the local culture and lifestyle on their term"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "on at the Cape Spartel Promontory.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "one generation to another. \n Every dish entails a historical anecdote that will be interestingly unveiled to you by your expert "}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": " you to the Kasbah that is perched uphill and was historically used as a defense station. It overlooks panoramically the Medina "}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "on at the Cape Spartel Promontory.  Visit the Pre-historic Caves of Hercules  Meet the local culture and lifestyle on their own "}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "by the sandy beach of the Atlantic.  Visit the Prehistoric Caves of Hercules  Meet the local culture and lifestyle on their term"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-nature','activity','{"id": "activity-nature", "kind": "activity", "name": "Nature", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Seville.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 39, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "f Tangier, this is a journey that blends culture, nature, and adventure. \n Whether you’re exploring with friends, family, or a"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "ue City   Hike through the scenic  Akchour Valley waterfalls   Explore  Tangier’s Kasbah, Medina, and souks  with a local guide  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "t a relaxed pace. Whether you’re seeking history, nature, or authentic Moroccan culture, this  trip from Malaga to Morocco in "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "ike in the stunning Akchour Valley, known for its waterfalls and scenic landscapes. This is a chance to enjoy Morocco’s natural b"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "n the stunning  Valley of Akchour , known for its waterfalls, rock formations, and scenic trails. After some time exploring this "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "from Tarifa to Morocco in 3 days  blends culture, nature, and comfort. Other options include a  3 Day Morocco tour from Malaga"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "t historic palaces, stop at  Perdicaris Park  for nature views, and continue to the majestic Cape Spartel, where the Atlantic "}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "ranean Sea embrace in an awe-inspiring display of nature’s grandeur. You stand at the edge of two worlds, a powerful metaphor "}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": " actual history behind the blue color. Get to the waterfall, which is, in fact, a basin where women wash clothes and carpets, han"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-shopping-souks','activity','{"id": "activity-shopping-souks", "kind": "activity", "name": "Shopping & Souks", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 40, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": " through the city’s  Kasbah, Medina, and colorful souks , giving you insight into Moroccan culture, history, and daily life."}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "the old Kasbah , the historic Medina, and vibrant souks. You’ll have time to learn about Moroccan culture and enjoy the colo"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "through the Kasbah , the Medina, and the colorful souks. Discover hidden alleyways, historic sites, and authentic Moroccan c"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections  Taste local food    Detailed Itinerar"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "terfalls   Explore  Tangier’s Kasbah, Medina, and souks  with a local guide  Overnight stays in charming Moroccan  Riads   \n"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "ing tour of Tangier’s Kasbah, Medina, and vibrant souks. Stroll through narrow alleys filled with history and culture before"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "y the Atlantic coast, and wander through colorful souks and medinas, all with the comfort of a private driver and guide. \n 0"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": " and the Medina. Discover narrow alleys, colorful souks, and panoramic views over the sea. Later, your guide will escort you"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "alking tour of the Kasbah &amp; Medina  Visit the Souks &amp; come to terms with the local culture  Stretch your legs throug"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "ate alleyways of the vibrant Medina and visit the Souks which are divided into different sections based on specialties inclu"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "ore meandering around the vibrant and traditional Souks (Markets) of Marrakech to end your day tour at the Square of Jemaa E"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "ntricate alleyways of the Medina with its vibrant Souks (markets) being organized into different sections. End the tour at t"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "o 1956. Continue on the track through the vibrant Souks before getting the Jemaa El-Fna, which the focal point of Marrakech."}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "nder around the authentic Medina with its vibrant Souks (markets) that are organized into different sections before continui"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "bah Museum and the American Legation  Explore the Souks, that is divided into sections  Taste local food    Detailed Itinera"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "rom the historic streets of Cadiz to the colorful souks and Atlantic beaches of Morocco, all with private transportation, fa"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": " filled our day with history, food, religious and shopping experiences. He took us everywhere we wanted to go, showing us the pu"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections  Taste local food    Detailed Itinerar"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Socco and is divided into five main quarters; the Souks (markets) are also divided into sections such as fish, vegetable, an"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "hub for cultural &amp; commercial activities. The Souks (markets) are organized into sections based on the products on sales"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "mp; Medina  Visit the Kasbah Museum.  Explore the Souks that is divided into sections  Taste local food    Detailed Itinerar"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "bah Museum and the American Legation  Explore the Souks, that is divided into sections  Taste local food    Detailed Itinera"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections  Taste local food    Tangier Day Trip "}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections  Taste local food    Detailed Itinerar"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "ts. From camel rides on the beach to the colorful souks of Tangier, you’ll explore vibrant traditions, ancient sites, and de"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "bah Museum and the American Legation  Explore the Souks, that is divided into sections  Taste local food  \n Overview \n Your "}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections  Taste local food    Detailed Itinerar"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "bah Museum and the American Legation  Explore the Souks that is divided into sections    Detailed Itinerary \n  MEET &amp; GR"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": " filled our day with history, food, religious and shopping experiences. He took us everywhere we wanted to go, showing us the pu"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "bah Museum and the American Legation  Explore the Souks that are divided into sections  Taste local food    Tangier Shore Ex"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": " beauty of the blue-painted building and streets  Shopping in Chefchaouen is hassle-free and reasonably priced  Enjoy a nice lun"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": " blue town of Chefchaouen    Free time for lunch, shopping, and exploring    Return in the evening with unforgettable memories  "}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "bah Museum and the American Legation  Explore the Souks, that is divided into sections  Taste local food    Detailed Itinera"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-photography','activity','{"id": "activity-photography", "kind": "activity", "name": "Photography", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Marbella-1.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 41, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "ted streets and laid-back charm, Chefchaouen is a photographer’s dream. Take a guided tour of the Medina to uncover its Andalusian"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": " its scenic trails, perfect for nature lovers and photographers alike. \n After your hike, return to Tangier, where you’ll spend th"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "You may opt for waking up early to getting unique photographs while appreciating the stillness of the whole area. After having bre"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "gh Atlas Mountains, Ziz Gorge and a nice stop for photographing the panoramic view of the palm valley of Ziz. We resume our journe"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": " light jacket is recommended in cooler months. \n  Photography Tips:  \n  Chefchaouen is one of the most photogenic towns in Morocco"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('activity-coastal-experiences','activity','{"id": "activity-coastal-experiences", "kind": "activity", "name": "Coastal Experiences", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 42, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "days, you’ll cross continents, ride camels by the beach, explore the blue alleys of Chefchaouen, and discover the ancient cha"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": " Visit Cape Spartel and enjoy a camel ride by the beach  Guided tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "ate transportation, you’ll journey from the sunny coast of Spain to the heart of Morocco’s most fascinating cities. From came"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": " Visit Cape Spartel and enjoy a camel ride by the beach  Guided tour of Chefchaouen, the Blue Pearl of Morocco  Walking tour "}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "aves..  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Kasbah Museum and the American Legation  "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": " Atlantic. Next, enjoy a short  camel ride by the beach , before heading into the Rif Mountains towards  Chefchaouen . This b"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "l Rif Mountains. From camel rides by the Atlantic coast to guided tours of historic medinas, this tour combines culture, adve"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "dmarks, enjoy a guided camel ride by the Atlantic coast, and wander through colorful souks and medinas, all with the comfort "}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "l explore Cape Spartel, enjoy a camel ride on the beach, visit the “Blue Pearl” of Chefchaouen, hike the scenic Akchour Valle"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "ere you’ll visit Cape Spartel, ride camels on the beach, and explore the Hercules Caves before heading to Chefchaouen for a g"}, {"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "ng; then to the Hercules Caves along the Atlantic Coastline but we may include a time for camel ride experience by the sandy "}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "and then continue on the track along the Atlantic Coastline where we will experience the camel ride by the sandy beach. Visit"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "e, each with its own charm. The camel ride by the beach and walking through the old medinas were unforgettable highlights. If"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "ra “Wind City of Africa” which is at the Atlantic Coastline. An atmospheric fishing port with fortifications to protect its M"}, {"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "address in Benalmadena and drive along the scenic coastline to the port of Tarifa. There, you’ll board the 9 a.m. fast ferry "}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "reets of Cadiz to the colorful souks and Atlantic beaches of Morocco, all with private transportation, fast ferry tickets, an"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "n with your name on it. \n Nestled on the northern coast of Africa, Tangier beckons with its rich history, diverse culture, an"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "our guide; the camel ride experience by the sandy beach of the Atlantic to a surprisingly Moroccan delicacy in a local restau"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "before continuing on the track along the Atlantic Coastline to Asilah. This artistic city features beauty, tranquility and un"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "ay want to experience the camel ride by the sandy beach before making a visit to the pre-historic Hercules Caves. \n  Guided W"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "ntory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Pre-historic Caves of Hercules  Meet the "}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "forgettable journey  takes you from Spain’s sunny coast to the magical streets of Tangier in just one day. This private exper"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "ay want to experience the camel ride on the sandy beach of Tangier. \n EXPLORE THE KASBAH &amp; MEDINA OF TANGIER \n Your full-"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "ntory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Pre-historic Caves of Hercules  Meet the "}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": " crave authentic moments. From camel rides on the beach to the colorful souks of Tangier, you’ll explore vibrant traditions, "}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "your doorstep in Sotogrande to camel rides on the beach and wandering through the bustling Medina of Tangier, every detail is"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "its, ready to take you on a gentle ride along the beach. Feel the rhythm of the waves and the soft caress of the sea breeze a"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "unique experience or a refreshing change from the beaches of Spain, this  Spain to Chefchaouen day trip  will leave lasting m"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "ntory.  Have a camel ride experience by the sandy beach of the Atlantic.  Visit the Prehistoric Caves of Hercules  Meet the l"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('duration-1-day','duration','{"id": "duration-1-day", "kind": "duration", "name": "1 day", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 43, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/tangier-day-trips/benalmadena-to-morocco-day-trip/", "excerpt": "Benalmadena to Morocco Day Trip benalmadena-to-morocco-day-trip"}, {"path": "/tangier-day-trips/cadiz-to-morocco-day-trip/", "excerpt": "Cadiz to Morocco Day Trip cadiz-to-morocco-day-trip"}, {"path": "/tangier-day-trips/day-trip-from-marbella-to-morocco/", "excerpt": "Day Trip from Marbella to Morocco day-trip-from-marbella-to-morocco"}, {"path": "/tangier-day-trips/day-trip-to-morocco-from-spain/", "excerpt": "Luxury Day Trip to Morocco from Spain day-trip-to-morocco-from-spain"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-asilah/", "excerpt": "Best Day Trip to Tangier and Asilah day-trip-to-tangier-and-asilah"}, {"path": "/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/", "excerpt": "Best Tangier and Tetouan Day Trip day-trip-to-tangier-and-tetouan-from-gibraltar"}, {"path": "/tangier-day-trips/estepona-to-tangier-day-trip/", "excerpt": "Private Estepona to Tangier Day Trip estepona-to-tangier-day-trip"}, {"path": "/tangier-day-trips/fuengirola-to-morocco-day-trip/", "excerpt": "Fuengirola to Morocco Day Trip fuengirola-to-morocco-day-trip"}, {"path": "/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/", "excerpt": "Best Day Trip to Tangier from Tarifa, Spain full-day-trip-to-tangier-from-tarifa-sp"}, {"path": "/tangier-day-trips/malaga-day-trip-to-morocco/", "excerpt": "Luxury Malaga Day Trip to Morocco malaga-day-trip-to-morocco"}, {"path": "/tangier-day-trips/rota-to-morocco-day-trip/", "excerpt": "Rota to Morocco Day Trip rota-to-morocco-day-trip"}, {"path": "/tangier-day-trips/sotogrande-to-morocco-day-trip/", "excerpt": "Sotogrande to Morocco Day Trip sotogrande-to-morocco-day-trip"}, {"path": "/tangier-day-trips/tangier-day-trip-from-seville/", "excerpt": "Tangier Day Trip from Seville tangier-day-trip-from-seville"}, {"path": "/tangier-day-trips/tangier-food-tour/", "excerpt": "Cultural Tangier Food Tour tangier-food-tour"}, {"path": "/tangier-day-trips/tangier-guided-walking-tour/", "excerpt": "Best Tangier Guided Walking Tour tangier-guided-walking-tour"}, {"path": "/tangier-day-trips/tangier-shore-excursion/", "excerpt": "Private Tangier Shore Excursion tangier-shore-excursion"}, {"path": "/tangier-day-trips/tangier-to-chefchaouen-day-trip/", "excerpt": "Tangier to Chefchaouen Day Trip tangier-to-chefchaouen-day-trip"}, {"path": "/tangier-day-trips/tarifa-to-chefchaouen-day-trip/", "excerpt": "Tarifa to Chefchaouen Day Trip tarifa-to-chefchaouen-day-trip"}, {"path": "/tangier-day-trips/torremolinos-to-morocco-day-trip/", "excerpt": "Torremolinos to Morocco Day Trip torremolinos-to-morocco-day-trip"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('duration-2-3-days','duration','{"id": "duration-2-3-days", "kind": "duration", "name": "2–3 days", "country": "", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 44, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "2-Day Trip to Morocco from Gibraltar 2-day-trip-to-morocco-from-gibraltar"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-malaga/", "excerpt": "2-Day Trip to Morocco from Malaga 2-day-trip-to-morocco-from-malaga"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-marbella/", "excerpt": "2-Day Trip to Morocco from Marbella 2-day-trip-to-morocco-from-marbella"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-seville/", "excerpt": "2-Day Trip to Morocco from Seville 2-day-trip-to-morocco-from-seville"}, {"path": "/best-tangier-tours/2-day-trip-to-morocco-from-spain/", "excerpt": "2 Day Trip to Morocco from Spain 2-day-trip-to-morocco-from-spain"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-gibraltar/", "excerpt": "3 Day Morocco tour from Gibraltar 3-day-morocco-tour-from-gibraltar"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-malaga/", "excerpt": "3 Day Morocco tour from Malaga 3-day-morocco-tour-from-malaga"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-marbella/", "excerpt": "3 Day Morocco tour from Marbella 3-day-morocco-tour-from-marbella"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-seville/", "excerpt": "3 Day Morocco tour from Seville 3-day-morocco-tour-from-seville"}, {"path": "/best-tangier-tours/3-day-morocco-tour-from-tarifa/", "excerpt": "3 Day Morocco tour from Tarifa 3-day-morocco-tour-from-tarifa"}, {"path": "/best-tangier-tours/travel-from-spain-to-morocco/", "excerpt": "TRAVEL FROM SPAIN TO MOROCCO 3 DAYS / 2 NIGHTS travel-from-spain-to-morocco"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('duration-4-6-days','duration','{"id": "duration-4-6-days", "kind": "duration", "name": "4–6 days", "country": "", "image": "/wp-content/uploads/2019/03/rabat.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 45, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/5-day-morocco-tour-from-spain/", "excerpt": "PRIVATE 5 DAY MOROCCO TOUR FROM SPAIN 5-day-morocco-tour-from-spain"}, {"path": "/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/", "excerpt": "4-Day Morocco Tour from Spain trip-tangier-to-fes-chefchaouen-4-days-3-nigh"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('duration-7-days','duration','{"id": "duration-7-days", "kind": "duration", "name": "7+ days", "country": "", "image": "/wp-content/uploads/2019/05/morocco-desert11.jpg", "icon": "compass", "description": "", "seoUrl": "", "visible": true, "featured": true, "order": 46, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/desert-trips/morocco-desert-trip-from-spain/", "excerpt": "Morocco Desert Trip From Spain 11 D / 10 N morocco-desert-trip-from-spain"}, {"path": "/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/", "excerpt": "BEST PRIVATE MOROCCO TOUR 10 DAYS / 9 NIGHTS best-private-morocco-tour-10-days-9-nights"}, {"path": "/morocco-vacation-packages/marrakech-desert-tour/", "excerpt": "MARRAKECH DESERT TOUR 8 DAYS / 7 NIGHTS marrakech-desert-tour"}, {"path": "/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/", "excerpt": "MARRAKECH DESERT TRIP 7 DAYS / 6 NIGHTS marrakech-desert-trip-7-days-6-nights"}, {"path": "/morocco-vacation-packages/morocco-trip-15-days-14-nights/", "excerpt": "Morocco Trip 15 Days/14 Nights morocco-trip-15-days-14-nights"}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_terms VALUES ('origin-la-linea','origin','{"id": "origin-la-linea", "kind": "origin", "name": "La Línea", "country": "Spain", "image": "/wp-content/uploads/2025/07/2-day-trip-to-Morocco-from-Gibraltar.jpg", "icon": "map", "description": "", "seoUrl": "/gibraltar-to-morocco-tours/", "visible": true, "featured": true, "order": 19.1, "transferAvailable": false, "transferDestination": "", "transferDuration": "", "distance": "", "notes": "", "evidence": [{"path": "/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/", "excerpt": "You’ll be picked up from La Línea de la Concepción — just steps from the Gibraltar border."}]}','2026-09-16');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-0','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-1','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-2','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-3','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-4','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-5','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-6','/best-tangier-tours/3-day-morocco-tour-from-malaga/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-7','/best-tangier-tours/3-day-morocco-tour-from-marbella/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-8','/best-tangier-tours/3-day-morocco-tour-from-seville/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-9','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-10','/best-tangier-tours/5-day-morocco-tour-from-spain/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-11','/best-tangier-tours/travel-from-spain-to-morocco/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-12','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-13','/desert-trips/morocco-desert-trip-from-spain/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-14','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-15','/tangier-day-trips/benalmadena-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-16','/tangier-day-trips/cadiz-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-17','/tangier-day-trips/day-trip-from-marbella-to-morocco/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-18','/tangier-day-trips/day-trip-to-morocco-from-spain/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-19','/tangier-day-trips/day-trip-to-tangier-and-asilah/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-20','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-21','/tangier-day-trips/estepona-to-tangier-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-22','/tangier-day-trips/fuengirola-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-23','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-24','/tangier-day-trips/malaga-day-trip-to-morocco/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-25','/tangier-day-trips/rota-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-26','/tangier-day-trips/sotogrande-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-27','/tangier-day-trips/tangier-day-trip-from-seville/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-28','/tangier-day-trips/tangier-food-tour/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-29','/tangier-day-trips/tangier-guided-walking-tour/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-30','/tangier-day-trips/tangier-shore-excursion/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-31','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-32','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-33','/tangier-day-trips/torremolinos-to-morocco-day-trip/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-34','/tangier-taxi/tangier-to-chefchaouen-taxi/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-35','/tangier-taxi/tangier-to-fes-via-chefchaouen/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-36','/taxi-transfers/tangier-airport-taxi/','destination-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-37','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-38','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-39','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-40','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-41','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-42','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-43','/best-tangier-tours/3-day-morocco-tour-from-malaga/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-44','/best-tangier-tours/3-day-morocco-tour-from-marbella/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-45','/best-tangier-tours/3-day-morocco-tour-from-seville/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-46','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-47','/best-tangier-tours/5-day-morocco-tour-from-spain/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-48','/best-tangier-tours/travel-from-spain-to-morocco/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-49','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-50','/desert-trips/morocco-desert-trip-from-spain/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-51','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-52','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-53','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-54','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-55','/tangier-taxi/tangier-to-chefchaouen-taxi/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-56','/tangier-taxi/tangier-to-fes-via-chefchaouen/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-57','/taxi-transfers/tangier-airport-taxi/','destination-chefchaouen');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-58','/best-tangier-tours/5-day-morocco-tour-from-spain/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-59','/best-tangier-tours/travel-from-spain-to-morocco/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-60','/desert-trips/morocco-desert-trip-from-spain/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-61','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-62','/tangier-day-trips/day-trip-to-tangier-and-asilah/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-63','/taxi-transfers/tangier-airport-taxi/','destination-asilah');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-64','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-tetouan');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-65','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','destination-tetouan');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-66','/taxi-transfers/tangier-airport-taxi/','destination-tetouan');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-67','/best-tangier-tours/5-day-morocco-tour-from-spain/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-68','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-69','/desert-trips/morocco-desert-trip-from-spain/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-70','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-71','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-72','/tangier-taxi/tangier-to-fes-via-chefchaouen/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-73','/taxi-transfers/tangier-airport-taxi/','destination-fes');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-74','/best-tangier-tours/5-day-morocco-tour-from-spain/','destination-rabat');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-75','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-rabat');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-76','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-rabat');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-77','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-casablanca');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-78','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-casablanca');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-79','/desert-trips/morocco-desert-trip-from-spain/','destination-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-80','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-81','/morocco-vacation-packages/marrakech-desert-tour/','destination-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-82','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','destination-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-83','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-84','/morocco-vacation-packages/marrakech-desert-tour/','destination-merzouga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-85','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','destination-merzouga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-86','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-merzouga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-87','/desert-trips/morocco-desert-trip-from-spain/','destination-sahara');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-88','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','destination-sahara');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-89','/morocco-vacation-packages/marrakech-desert-tour/','destination-sahara');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-90','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','destination-sahara');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-91','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-sahara');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-92','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','destination-essaouira');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-93','/tangier-day-trips/day-trip-to-tangier-and-asilah/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-94','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-95','/tangier-day-trips/tangier-food-tour/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-96','/tangier-day-trips/tangier-guided-walking-tour/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-97','/tangier-day-trips/tangier-shore-excursion/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-98','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-99','/tangier-taxi/tangier-to-chefchaouen-taxi/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-100','/tangier-taxi/tangier-to-fes-via-chefchaouen/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-101','/taxi-transfers/tangier-airport-taxi/','origin-tangier');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-102','/morocco-vacation-packages/marrakech-desert-tour/','origin-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-103','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','origin-marrakech');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-104','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','origin-tarifa');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-105','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','origin-tarifa');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-106','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','origin-tarifa');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-107','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','origin-seville');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-108','/best-tangier-tours/3-day-morocco-tour-from-seville/','origin-seville');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-109','/tangier-day-trips/tangier-day-trip-from-seville/','origin-seville');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-110','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','origin-malaga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-111','/best-tangier-tours/3-day-morocco-tour-from-malaga/','origin-malaga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-112','/tangier-day-trips/malaga-day-trip-to-morocco/','origin-malaga');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-113','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','origin-marbella');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-114','/best-tangier-tours/3-day-morocco-tour-from-marbella/','origin-marbella');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-115','/tangier-day-trips/day-trip-from-marbella-to-morocco/','origin-marbella');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-116','/tangier-day-trips/estepona-to-tangier-day-trip/','origin-estepona');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-117','/tangier-day-trips/cadiz-to-morocco-day-trip/','origin-cadiz');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-118','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','origin-gibraltar');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-119','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','origin-gibraltar');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-120','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','origin-gibraltar');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-121','/tangier-day-trips/benalmadena-to-morocco-day-trip/','origin-benalmadena');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-122','/tangier-day-trips/torremolinos-to-morocco-day-trip/','origin-torremolinos');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-123','/tangier-day-trips/fuengirola-to-morocco-day-trip/','origin-fuengirola');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-124','/tangier-day-trips/rota-to-morocco-day-trip/','origin-rota');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-125','/tangier-day-trips/sotogrande-to-morocco-day-trip/','origin-sotogrande');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-126','/tangier-day-trips/benalmadena-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-127','/tangier-day-trips/cadiz-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-128','/tangier-day-trips/day-trip-from-marbella-to-morocco/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-129','/tangier-day-trips/day-trip-to-morocco-from-spain/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-130','/tangier-day-trips/day-trip-to-tangier-and-asilah/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-131','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-132','/tangier-day-trips/estepona-to-tangier-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-133','/tangier-day-trips/fuengirola-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-134','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-135','/tangier-day-trips/malaga-day-trip-to-morocco/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-136','/tangier-day-trips/rota-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-137','/tangier-day-trips/sotogrande-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-138','/tangier-day-trips/tangier-day-trip-from-seville/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-139','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-140','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-141','/tangier-day-trips/torremolinos-to-morocco-day-trip/','type-private-day-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-142','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-143','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-144','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-145','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-146','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-147','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-148','/best-tangier-tours/3-day-morocco-tour-from-malaga/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-149','/best-tangier-tours/3-day-morocco-tour-from-marbella/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-150','/best-tangier-tours/3-day-morocco-tour-from-seville/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-151','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-152','/best-tangier-tours/5-day-morocco-tour-from-spain/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-153','/best-tangier-tours/travel-from-spain-to-morocco/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-154','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','type-short-morocco-trips');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-155','/desert-trips/morocco-desert-trip-from-spain/','type-multi-day-morocco-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-156','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','type-multi-day-morocco-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-157','/morocco-vacation-packages/marrakech-desert-tour/','type-multi-day-morocco-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-158','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','type-multi-day-morocco-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-159','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','type-multi-day-morocco-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-160','/tangier-day-trips/tangier-shore-excursion/','type-shore-excursions');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-161','/desert-trips/morocco-desert-trip-from-spain/','type-desert-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-162','/morocco-vacation-packages/marrakech-desert-tour/','type-desert-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-163','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','type-desert-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-164','/tangier-day-trips/tangier-food-tour/','type-city-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-165','/tangier-day-trips/tangier-guided-walking-tour/','type-city-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-166','/tangier-taxi/tangier-to-chefchaouen-taxi/','type-private-transfers');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-167','/tangier-taxi/tangier-to-fes-via-chefchaouen/','type-private-transfers');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-168','/taxi-transfers/tangier-airport-taxi/','type-private-transfers');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-169','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-170','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-171','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-172','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-173','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-174','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-175','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-176','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-177','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-178','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-179','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-180','/best-tangier-tours/travel-from-spain-to-morocco/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-181','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-182','/desert-trips/morocco-desert-trip-from-spain/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-183','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-184','/morocco-vacation-packages/marrakech-desert-tour/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-185','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-186','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-187','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-188','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-189','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-190','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-191','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-192','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-193','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-194','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-195','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-196','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-197','/tangier-day-trips/rota-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-198','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-199','/tangier-day-trips/tangier-day-trip-from-seville/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-200','/tangier-day-trips/tangier-food-tour/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-201','/tangier-day-trips/tangier-guided-walking-tour/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-202','/tangier-day-trips/tangier-shore-excursion/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-203','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-204','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-205','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-culture');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-206','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-207','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-208','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-209','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-210','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-211','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-212','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-213','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-214','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-215','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-216','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-217','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-218','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-219','/morocco-vacation-packages/marrakech-desert-tour/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-220','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-221','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-222','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-223','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-224','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-225','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-226','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-227','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-228','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-229','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-230','/tangier-day-trips/rota-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-231','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-232','/tangier-day-trips/tangier-day-trip-from-seville/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-233','/tangier-day-trips/tangier-guided-walking-tour/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-234','/tangier-day-trips/tangier-shore-excursion/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-235','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-sightseeing');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-236','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-food-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-237','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-food-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-238','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-food-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-239','/tangier-day-trips/tangier-food-tour/','activity-food-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-240','/tangier-day-trips/tangier-guided-walking-tour/','activity-food-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-241','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-242','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-243','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-244','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-245','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-246','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-247','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-248','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-249','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-250','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-251','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-252','/best-tangier-tours/travel-from-spain-to-morocco/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-253','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-254','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-255','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-256','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-257','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-258','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-259','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-260','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-261','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-262','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-263','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-264','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-265','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-266','/tangier-day-trips/rota-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-267','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-268','/tangier-day-trips/tangier-day-trip-from-seville/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-269','/tangier-day-trips/tangier-guided-walking-tour/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-270','/tangier-day-trips/tangier-shore-excursion/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-271','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-camel-rides');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-272','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-273','/desert-trips/morocco-desert-trip-from-spain/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-274','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-275','/morocco-vacation-packages/marrakech-desert-tour/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-276','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-277','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-278','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-desert-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-279','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-280','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-281','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-282','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-283','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-284','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-285','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-286','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-287','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-288','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-289','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-290','/best-tangier-tours/travel-from-spain-to-morocco/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-291','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-292','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-293','/morocco-vacation-packages/marrakech-desert-tour/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-294','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-295','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-296','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-297','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-298','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-299','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-300','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-301','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-302','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-303','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-304','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-305','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-306','/tangier-day-trips/rota-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-307','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-308','/tangier-day-trips/tangier-day-trip-from-seville/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-309','/tangier-day-trips/tangier-food-tour/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-310','/tangier-day-trips/tangier-guided-walking-tour/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-311','/tangier-day-trips/tangier-shore-excursion/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-312','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-313','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-314','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-walking-tours');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-315','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-316','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-317','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-318','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-319','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-320','/best-tangier-tours/travel-from-spain-to-morocco/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-321','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-322','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-323','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-324','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-325','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-326','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-327','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-328','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-329','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-330','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-331','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-332','/tangier-day-trips/rota-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-333','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-334','/tangier-day-trips/tangier-day-trip-from-seville/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-335','/tangier-day-trips/tangier-food-tour/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-336','/tangier-day-trips/tangier-guided-walking-tour/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-337','/tangier-day-trips/tangier-shore-excursion/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-338','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-historical-sites');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-339','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-340','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-341','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-342','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-343','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-344','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-345','/tangier-day-trips/rota-to-morocco-day-trip/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-346','/tangier-day-trips/tangier-day-trip-from-seville/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-347','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','activity-nature');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-348','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-349','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-350','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-351','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-352','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-353','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-354','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-355','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-356','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-357','/best-tangier-tours/travel-from-spain-to-morocco/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-358','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-359','/morocco-vacation-packages/marrakech-desert-tour/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-360','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-361','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-362','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-363','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-364','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-365','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-366','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-367','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-368','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-369','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-370','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-371','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-372','/tangier-day-trips/rota-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-373','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-374','/tangier-day-trips/tangier-day-trip-from-seville/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-375','/tangier-day-trips/tangier-food-tour/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-376','/tangier-day-trips/tangier-guided-walking-tour/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-377','/tangier-day-trips/tangier-shore-excursion/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-378','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-379','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-380','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-shopping-souks');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-381','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-photography');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-382','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-photography');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-383','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-photography');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-384','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','activity-photography');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-385','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','activity-photography');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-386','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-387','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-388','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-389','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-390','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-391','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-392','/best-tangier-tours/3-day-morocco-tour-from-malaga/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-393','/best-tangier-tours/3-day-morocco-tour-from-marbella/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-394','/best-tangier-tours/3-day-morocco-tour-from-seville/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-395','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-396','/best-tangier-tours/5-day-morocco-tour-from-spain/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-397','/best-tangier-tours/travel-from-spain-to-morocco/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-398','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-399','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-400','/tangier-day-trips/benalmadena-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-401','/tangier-day-trips/cadiz-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-402','/tangier-day-trips/day-trip-from-marbella-to-morocco/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-403','/tangier-day-trips/day-trip-to-morocco-from-spain/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-404','/tangier-day-trips/day-trip-to-tangier-and-asilah/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-405','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-406','/tangier-day-trips/estepona-to-tangier-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-407','/tangier-day-trips/fuengirola-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-408','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-409','/tangier-day-trips/malaga-day-trip-to-morocco/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-410','/tangier-day-trips/rota-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-411','/tangier-day-trips/sotogrande-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-412','/tangier-day-trips/tangier-shore-excursion/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-413','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-414','/tangier-day-trips/torremolinos-to-morocco-day-trip/','activity-coastal-experiences');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-415','/tangier-day-trips/benalmadena-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-416','/tangier-day-trips/cadiz-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-417','/tangier-day-trips/day-trip-from-marbella-to-morocco/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-418','/tangier-day-trips/day-trip-to-morocco-from-spain/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-419','/tangier-day-trips/day-trip-to-tangier-and-asilah/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-420','/tangier-day-trips/day-trip-to-tangier-and-tetouan-from-gibraltar/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-421','/tangier-day-trips/estepona-to-tangier-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-422','/tangier-day-trips/fuengirola-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-423','/tangier-day-trips/full-day-trip-to-tangier-from-tarifa-spain/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-424','/tangier-day-trips/malaga-day-trip-to-morocco/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-425','/tangier-day-trips/rota-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-426','/tangier-day-trips/sotogrande-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-427','/tangier-day-trips/tangier-day-trip-from-seville/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-428','/tangier-day-trips/tangier-food-tour/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-429','/tangier-day-trips/tangier-guided-walking-tour/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-430','/tangier-day-trips/tangier-shore-excursion/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-431','/tangier-day-trips/tangier-to-chefchaouen-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-432','/tangier-day-trips/tarifa-to-chefchaouen-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-433','/tangier-day-trips/torremolinos-to-morocco-day-trip/','duration-1-day');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-434','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-435','/best-tangier-tours/2-day-trip-to-morocco-from-malaga/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-436','/best-tangier-tours/2-day-trip-to-morocco-from-marbella/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-437','/best-tangier-tours/2-day-trip-to-morocco-from-seville/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-438','/best-tangier-tours/2-day-trip-to-morocco-from-spain/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-439','/best-tangier-tours/3-day-morocco-tour-from-gibraltar/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-440','/best-tangier-tours/3-day-morocco-tour-from-malaga/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-441','/best-tangier-tours/3-day-morocco-tour-from-marbella/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-442','/best-tangier-tours/3-day-morocco-tour-from-seville/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-443','/best-tangier-tours/3-day-morocco-tour-from-tarifa/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-444','/best-tangier-tours/travel-from-spain-to-morocco/','duration-2-3-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-445','/best-tangier-tours/5-day-morocco-tour-from-spain/','duration-4-6-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-446','/best-tangier-tours/trip-tangier-to-fes-chefchaouen-4-days-3-nights/','duration-4-6-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-447','/desert-trips/morocco-desert-trip-from-spain/','duration-7-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-448','/morocco-vacation-packages/best-private-morocco-tour-10-days-9-nights/','duration-7-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-449','/morocco-vacation-packages/marrakech-desert-tour/','duration-7-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-450','/morocco-vacation-packages/marrakech-desert-trip-7-days-6-nights/','duration-7-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-451','/morocco-vacation-packages/morocco-trip-15-days-14-nights/','duration-7-days');
--> statement-breakpoint
INSERT INTO discovery_links VALUES ('seed-452','/best-tangier-tours/2-day-trip-to-morocco-from-gibraltar/','origin-la-linea');
--> statement-breakpoint
INSERT INTO settings VALUES ('discovery-config','{"social": [{"id": "0", "name": "Facebook", "url": "https://www.facebook.com/tangierexcursions", "enabled": true, "newTab": true}, {"id": "1", "name": "X", "url": "https://twitter.com/tangierexcursio", "enabled": true, "newTab": true}, {"id": "2", "name": "Pinterest", "url": "https://www.pinterest.com/tangierexcursions/", "enabled": true, "newTab": true}, {"id": "3", "name": "Instagram", "url": "https://www.instagram.com/tangierexcursion/", "enabled": true, "newTab": true}], "footer": [{"id": "0", "group": "Experiences", "name": "Private day trips", "url": "/tangier-day-trips/", "enabled": true}, {"id": "1", "group": "Experiences", "name": "Short Morocco trips", "url": "/best-tangier-tours/", "enabled": true}, {"id": "2", "group": "Experiences", "name": "Morocco vacation packages", "url": "/morocco-vacation-packages/", "enabled": true}, {"id": "3", "group": "Destinations", "name": "From Seville", "url": "/seville-to-morocco-tours/", "enabled": true}, {"id": "4", "group": "Destinations", "name": "From M\u00e1laga", "url": "/malaga-to-morocco-tours/", "enabled": true}, {"id": "5", "group": "Destinations", "name": "From Tarifa", "url": "/tarifa-to-morocco-tours/", "enabled": true}, {"id": "6", "group": "Support", "name": "My bookings", "url": "/account/", "enabled": true}, {"id": "7", "group": "Support", "name": "Wishlist", "url": "/wishlist/", "enabled": true}, {"id": "8", "group": "Support", "name": "Terms & conditions", "url": "/terms-conditions/", "enabled": true}, {"id": "9", "group": "Company", "name": "About us", "url": "/about-us/", "enabled": true}, {"id": "10", "group": "Company", "name": "Travel inspiration", "url": "/morocco-travel-blog/", "enabled": true}, {"id": "11", "group": "Company", "name": "Guest reviews", "url": "/tangier-excursions-reviews/", "enabled": true}], "recommendations": [], "sections": [{"id": "origins", "title": "Your journey starts here", "kind": "origin", "enabled": true}, {"id": "destinations", "title": "Explore Morocco", "kind": "destination", "enabled": true}, {"id": "types", "title": "Choose your journey", "kind": "type", "enabled": true}]}');
