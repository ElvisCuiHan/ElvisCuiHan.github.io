# Selected publications — first-page previews

Local-only update requested by the author on 2026-09-18. No push or deployment.

## Editorial order and layout

1. scGTM — Bioinformatics (2022).
2. The Statistical Compass — public arXiv working manuscript (2026).
3. Investigating the value of glucodensity analysis… — Frontiers (2023).

`_data/featured.yml` controls this order independently of the full bibliography.
The 28 bibliography records retain their metadata and order. Only the shortlist
flags changed. Each selected entry now has a real first-page image on the left,
its verified bibliographic information on the right, and source/resource links.
Below 700px the image and text stack. Images preserve their original proportions
on white paper surfaces in Ink & Paper, Day and Night; no recoloring or mock covers.
The author name is emphasized, including the arXiv name variant Eliuvish Han Cui.
Compass explicitly remains a working manuscript, not a publisher-issued book.

## Image provenance

All images were rendered from page 1 with Poppler:

```sh
pdftoppm -f 1 -l 1 -scale-to 840 -singlefile -png SOURCE.pdf OUTPUT_STEM
```

No page content was altered. The only conversion is rasterization/downscaling.
The PDF skill was used for first-page rendering and direct PNG visual inspection.
Complete source PDFs are not copied into the generated site.

### scGTM

- Canonical record: https://pmc.ncbi.nlm.nih.gov/articles/PMC9991897/
- DOI: https://doi.org/10.1093/bioinformatics/btac423
- Local source: `06_COURSES_课程教学/life-at-westlake/papers/elvis-han-cui/2022/cui-et-al-2022-scgtm.pdf`, under the Westlake archive.
- Source SHA-256: `dc03547b352b6a9ab545a2f92000bb985364711cbd23f9789daca47dc6f5828f`.
- Output: `assets/images/publications/scgtm-first-page.png`, 651 × 840.
- Output SHA-256: `2bfb129178e9f86d7fca112fdb6c0bb2cc9527adc0ef95d002f6367327e50eee`.
- © The Author(s) 2022, Oxford University Press; all rights reserved. PMC availability
  does not make this a CC-licensed article. This first-page thumbnail is for the
  author's requested local preview. Confirm the applicable reuse basis before
  public release; do not describe it as openly licensed or mirror the full PDF.

### The Statistical Compass

- Public record: https://arxiv.org/abs/2606.11282
- Public PDF used: https://arxiv.org/pdf/2606.11282
- Downloaded PDF identifies itself as `arXiv:2606.11282v1`, 9 June 2026.
- Author: Eliuvish Han Cui (name as credited by the public record and cover).
- Record license: CC BY 4.0, https://creativecommons.org/licenses/by/4.0/.
- Source SHA-256: `046c557db14b491505b084aa2cb551d8e9fa91e9e50e50b33073574fbc2f8d94`.
- Output: `assets/images/publications/statistical-compass-first-page.png`, 541 × 840.
- Output SHA-256: `ff68f49deed90efc7258a406074e0bbf2812219bb8185ac80d1d59474a7d0458`.
- This is its actual colorful manuscript cover, not a newly designed cover.
  The title is verified visually because the cover is raster artwork.
  No private author-review manuscript was used. No claim of publisher publication.

### Investigating the value of glucodensity analysis…

- Canonical DOI: https://doi.org/10.3389/fcdhc.2023.1244613
- Official PDF: https://www.frontiersin.org/journals/clinical-diabetes-and-healthcare/articles/10.3389/fcdhc.2023.1244613/pdf
- © 2023 Cui, Goldfine, Quinlan, James and Sverdlov. Frontiers in Clinical Diabetes
  and Healthcare, volume 4, 1244613. CC BY 4.0, confirmed by the official article's
  copyright/license link. Authors, title, journal, source and license accompany the
  thumbnail in the page.
- Source SHA-256: `a67c8bda57ce88864f7eb05ad74ad3397948982435e6f2078db99cf4228bf0ad`.
- Output: `assets/images/publications/glucodensity-first-page.png`, 595 × 840.
- Output SHA-256: `fbb1ca5eb3bf00d0d345c8db48986dfdeecba35b98eb22c6688f6a369758e2f7`.

## Verification

- All three rendered PNGs opened and visually inspected: full first page visible,
  correct title, author and original page composition, no blank/broken render.
- Automated checks require the exact requested order, three actual local PNGs,
  correct image dimensions, lazy loading, descriptive alternative text, source
  links, license links and explicit working-manuscript status.
- The source PDF scratch directory is excluded from the generated site.
- Jekyll build passed. Site checks passed for 10 pages and 290 local links/assets;
  the complete 28-record bibliography, three research themes and 22 redirects are
  preserved. Appearance-cycle and WeChat-copy unit tests passed, as did
  `git diff --check`. The new Compass image responds with HTTP 200 on port 4017.
- Browser connection failed with a 10-second timeout on this iteration. Desktop
  and mobile browser screenshots, keyboard/focus interaction and three-theme
  visual inspection remain unverified for this change. Do not report the static
  build or JS unit tests as browser visual acceptance.

Preview: http://127.0.0.1:4017/#selected-title
