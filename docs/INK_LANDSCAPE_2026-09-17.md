# Ink landscape, name emphasis, and Friends

Status: local preview only. No push, deployment, domain change, or access change.

## Implementation

- Generated one original decorative xuan-paper / ink-wash landscape using the
  **built-in imagegen tool**, following the imagegen skill. No CLI fallback.
- Source: `assets/images/ink-landscape-v1.png` (1586 × 992, approximately 1.8 MB).
- Website asset: `assets/images/ink-landscape-v1.jpg` (same dimensions,
  approximately 289 KB). Converted with macOS `sips` at JPEG quality 83; no
  creative image edits or changes to the generated composition.
- Artwork is concentrated at the margins, with an additional light reading
  surface beneath the content. It is decorative (`aria-hidden="true"`), fixed,
  non-interactive, and has no motion. Dark mode reduces its opacity to 0.09.
  Minimal mode and print hide the artwork and its reading-surface overlay.
- `Elvis Han` now uses weight 700 in the main heading and navigation wordmark;
  `Cui` remains regular. Existing publication author emphasis is unchanged.
- Friends has its own `/friends/` page and top-navigation/footer entries. The
  homepage retains a short entry point; the full Yating Zou acknowledgement is
  on Friends. Existing homepage `#friends` and `#friend-yating-zou` anchors remain.
- The six navigation links use two rows of three on screens up to 480 px.
- Existing biography, publications, mentor recollections, and translation
  rights/access statuses have not been changed in this iteration.

## Final generation prompt

```text
Use case: stylized-concept
Asset type: production website background illustration, not a website screenshot or UI mockup.
Primary request: an original, refined Chinese literati ink-wash landscape on pale warm xuan paper for a scholar's personal website, quietly classical and scholarly.
Composition: wide landscape, approximately 16:10. A website reading column will cover the central 68 percent, so that entire central area must be essentially empty pale ivory paper. Confine the visible painting to the far left and far right margins, with low distant misty mountains and a calm lakeside shoreline in the lower outer corners. Let every mark softly dissolve into the blank paper toward the center and top. No painting should cross the reading column. The margins should still have distinct delicate brush detail so the classical landscape is visible at web scale.
Style/medium: original Chinese ink wash, gentle dry-brush edges, exquisite subtle uncoated xuan-paper fiber. Understated, spacious, serene. Not grunge or distressed parchment.
Color palette: very pale ivory (#fbfaf7) ground, muted gray-green ink, faint warm mineral-brown washes. Avoid strong black areas or saturated color.
Constraints: background art only; no people, faces, portraits, buildings, logos, stamps, seals, calligraphy, lettering, text, diagrams, border frames, watermark, or UI elements. Do not depict any specific existing artwork. Keep the whole image light enough for dark text, especially the blank center.
```

## Verification performed

- Jekyll build succeeded. Site checker passed: **11 pages / 286 local links and
  assets**, headings, anchors, bibliography, and affiliation assertions.
- Style and theme script tests passed, including persistence, blocked storage,
  accessible labels, and independence of style/color choices.
- Browser screenshot review at **1440 × 1000**, **390 × 844**, and **320 × 740**.
  Reviewed the homepage and Friends on desktop/390 px; Friends also at 320 px.
- Browser DOM measurements found no horizontal overflow at all three widths.
  Mobile navigation links are at least 44 px tall. Name weight was measured as 700.
- Clicked Friends from the main navigation and returned via About.
- Keyboard Tab moved from Mentors to Friends with a visible 2 px outline;
  Return opened `/friends/`, with the correct active-page navigation state.
- Switched to Minimal: both background layers were hidden. Reload preserved
  Minimal. Restored Ink & Paper, toggled dark/light, and reviewed screenshots.
- Main palette foreground/background ratios were calculated: light Ink & Paper
  text 11.40:1, muted 5.41:1, accent 6.26:1; dark text 12.51:1, muted 8.06:1,
  accent 8.24:1. These are flat palette checks, not exhaustive image-pixel audits.
- `git diff --check` passed.

## Limits

- Tested in the Codex in-app browser; no separate Safari/Firefox/device run.
- Print hiding and reduced-motion rules inspected in source; not newly tested
  through OS print or system reduced-motion settings in this iteration.
- Yating's exact external URL is retained; no new external-site content audit.

## Preview

- Homepage: http://127.0.0.1:4017/
- Friends: http://127.0.0.1:4017/friends/
- Build output: `_site-preview/` (not source, not for committing).
