# Pre-deployment verification — 2026-09-16

- Jekyll 3.10.0 local build: passed.
- Local build used the existing paginate, sitemap, feed, and redirect plugins.
  The unused gist plugin was omitted from the local invocation because its
  latest transitive dependencies no longer support macOS's bundled Ruby 2.6.
  The production plugin configuration and GitHub Pages build mechanism are unchanged.
- `ruby scripts/check-site.rb _site`: passed, 7 primary pages and 119 local
  links/assets, including GitHub Pages' legacy extensionless HTML resolution.
- `node scripts/check-theme.cjs`: passed (stored preference, light/dark switch,
  OS preference changes, blocked storage, labels, and legacy listener fallback).
- `git diff --check`: passed.
- All 41 HTML/PDF output paths from the baseline build remain present.
- Every existing file under `files/` and `images/` is byte-identical to the
  pre-redesign repository.
- The author-selected second image was copied without image generation or editing.
  SHA-256: `58440f58da03847c385a402f9eeed2807120b37c680c134421b3a3cea9a555c6`.
  It is the displayed profile image and Open Graph preview. The rejected first
  image is not referenced by the redesigned pages.
- Browser visual checks: desktop homepage at 1280 px, mobile homepage and
  publication page at 390 px, and navigation/CV at 320 px.
- At 390 px and 320 px, document width equals viewport width (no horizontal overflow).
- Avatar loaded successfully. Navigation between home, publications, and CV worked.
- Theme switching and persistence across page navigation were observed in-browser.
- Browser error log was empty during the checked session.

## Follow-up content expansion

- Research affiliation corrected to Qian Lab, Center for Interdisciplinary Studies,
  School of Science, Westlake University, consistently on home, metadata, and CV.
- Bibliography expanded from 5 to 28 entries: 10 journal/conference articles,
  16 preprints/working papers, and 2 long-form works. The homepage selects 4.
- The checker compares rendered paper IDs with the YAML catalog, verifies unique
  IDs and category membership/counts, checks affiliation, and verifies the avatar
  and downloadable card. All checks passed after the final rebuild.
- Publication author name variants are preserved from primary sources and
  highlighted in every entry. Browser DOM confirmed all 28 entries/highlights.
- Superseded publication claims on the old HTML CV are replaced with a link to
  the current bibliography. The PDF remains unchanged and labeled historical.
- Business-card image copied byte-for-byte from the user's attachment:
  `49297be6d553d8ae53910f8b921a31fea7d63f2ef9258f54163c107469039614`.
- Follow-up visual QA: desktop homepage/card at 1280 px, publications at 390 px,
  and publications/home/card at 320 px. No horizontal overflow was observed.
- The original 1672 × 941 card loaded; its full-resolution view and download links
  resolve locally. It remains uncropped and unchanged in both light and dark mode.
- Local browser error log was empty. Temporary viewport overrides were reset.

Metadata sources and scope limitations are in `docs/PUBLICATIONS_AUDIT.md`.
Changes are local only; no push or deployment was performed.
