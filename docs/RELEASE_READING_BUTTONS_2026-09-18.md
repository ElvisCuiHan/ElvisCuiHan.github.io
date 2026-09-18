# Reading buttons and Chinese readings · release authorization

The user requested: add buttons / improve the reading-page presentation, then
push to the existing personal website. Destination remains the established
ElvisCuiHan/ElvisCuiHan.github.io repository, master branch, GitHub Pages root.
No new hosting service, domain, permissions or access changes.

## Included

- Three source-checked Chinese reading pages and the AI & Drug Discovery shelf.
  Scope and rights remain recorded in AI_DRUG_DISCOVERY_READINGS.md.
- Native anchor buttons: primary Chinese reading / translated PDF, secondary
  original PDF and source links. Every catalogue record has a source button;
  catalogue-only records are not presented as downloadable Chinese editions.
- Reading-page primary button enters the focusable body; source metadata is a
  native details/summary disclosure. AI and review-status notices remain visible.
- Related-reading cards and a return button; compact Writing-preview CTAs.
- Existing pending author-requested changes: homepage styling credit to Yating,
  compact Writing row, and Jessica Li's reference link to JSB.

## Verification

- Jekyll build passed. Site checker: 13 routes, 369 local links/assets, 14
  catalogue records; original PDF hash and all source/rights constraints intact.
- Appearance and WeChat tests passed. git diff --check passed.
- Inspected real browser screenshots: Bender at desktop 1440px in Night and
  Ink & Paper; Bender at mobile 390px in Day; Ren and Xu at 390px in Ink & Paper;
  AI catalogue action buttons at 390px in Ink & Paper.
- Read-only DOM measurements found no horizontal overflow in inspected views.
  Reading actions were at least 44 CSS px high at 390px.
- Tested native source-disclosure click, Enter to collapse, Enter on the primary
  reading link, focus transfer to reading-body and Tab into the article links.
  Visible keyboard outline was present. At 390px, the reached body heading was
  below the sticky header, not hidden behind it.
- Tested related-card navigation Bender -> Ren, return to topic shelf, and
  catalogue button -> Xu. Tested Day -> Night -> Ink & Paper appearance cycle.
- The final Writing-page screenshot revealed uneven CTA baselines when one
  caption wrapped. A small flex-column adjustment aligns the three CTAs without
  fixed card heights. Restored Day and the default viewport after testing.
- Browser testing is not a fresh scientific review or full assistive-technology
  audit. No new source PDF, private course file, scratch output or screenshot is
  added to the public repository. PDF buttons go to the publisher, not mirrors.

## Release handling

The remote master matched local HEAD before staging. Publish with a normal
fast-forward push, never force. Verify the resulting Pages build and deployed
HTML after the push. Do not infer that the user's push request certifies the
new AI-assisted draft text as reviewed; that status is unchanged.
