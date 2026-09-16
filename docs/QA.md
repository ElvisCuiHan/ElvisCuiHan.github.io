# Pre-deployment verification — 2026-09-16

- Jekyll 3.10.0 local build: passed.
- Local build used the existing paginate, sitemap, feed, and redirect plugins.
  The unused gist plugin was omitted from the local invocation because its
  latest transitive dependencies no longer support macOS's bundled Ruby 2.6.
  The production plugin configuration and GitHub Pages build mechanism are unchanged.
- `ruby scripts/check-site.rb _site`: passed, 7 primary pages and 116 local
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

The publication list is deliberately a verified selection, not a comprehensive
update of the author's bibliography. The existing CV PDF remains historical and
is clearly identified on the CV page.
