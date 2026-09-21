# Homepage and product-card refinement

Private staging only. Existing URLs, metadata, source content, image files and category-image records remain unchanged.

- The three trust items beneath the hero use the shared accessible carousel. Mobile uses horizontal snap scrolling with a partial next item; desktop retains three complete items.
- Trip-type/activity/duration discovery cards use icons and real experience counts instead of category images. Destination/origin photography remains in place.
- Card images show only explicitly assigned badges. The automatic private/shared image label is removed. Presets: Popular, Hot, Awarded, Bestseller and New; custom labels are also supported, up to three per product. No popularity or award claims are assigned automatically.
- Admin → Tours / Transfers → General → Card badges edits durable product settings. Transfers use the same product editor and source protections; new products remain drafts pending review.
- Larger logos use the same header/footer padding. Mobile footer accordion headings increase to 16px.
- The journey section uses the existing navy, blue and gold palette with three clear icon-led steps. The guest-story section has a split editorial layout and retains the original testimonial wording and review links.
- The shared carousel respects reduced motion and calculates its movement from the actual card width and spacing.

Focused integration tests cover admin authorization, badge persistence and removal, frontend discovery data, protected SEO fields, image-free category markup and transfer-draft badge editing. Browser-based mobile visual verification remains unavailable following the preview-browser connection failure reported in the preceding revision; no visual QA pass is claimed.
