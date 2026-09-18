# Research-first edition · local review · 2026-09-18

## Scope and publication boundary

This change concerns Elvis Han Cui's personal academic website only. It does not
modify UNC-UCLA, Qian Lab, or course repositories. The 2026-09-18 edition is a
local review; no push or deployment is part of this revision.

## Evidence and content decisions

- The live canonical `/cv/`, `/publications/`, and `/teaching/` were already using
  the current identity. The reported student identity was not reproduced there.
- A standalone legacy `_pages/cv.html` did still contain “Ph.D. 2024 (expected)”
  and an open-ended UCLA GSR appointment. Remove that obsolete source and
  redirect its exact URL to the current CV. The deleted source is recoverable
  from Git history (`08a2e48:_pages/cv.html`), not from the generated website.
- Historical `files/CV.pdf` and three unverified legacy/sample paper PDFs are
  excluded from the build, not deleted from local storage. The current web CV
  can be printed to PDF. The custom 404 page points to current CV/publications.
- Empty blog/talk/tag/category archives now redirect to Writing. This is a
  replacement content hub, not a claim that essays are talks. No real talk
  inventory was established: the four `_talks` entries are template examples.
  Never promote them to Elvis's talks or invent 4–8 talks to populate the page.
- Actual historical UCLA teaching records are retained, with an explicit
  2020–2022 archive label. Correct the Winter 2022 title to match its own date.
- Template portfolios, sample publications, Markdown demos and template policy
  pages are excluded. Existing useful archive/portfolio/bookmark URLs redirect;
  irrelevant demos and template policy URLs intentionally return the site's 404.
- Three research themes are editorial organization, based on the author's
  requested themes, confirmed bio and existing 28-record bibliography. No new
  publication, acceptance, result, citation count or award is added. FCS is a
  current focus; related stochastic-process records are clearly preprints.
- The complete bibliography remains intact: 10 articles, 16 preprints and two
  long-form works. Sources remain in `PUBLICATIONS_AUDIT.md`.
- The homepage has a short Writing entry, not the earlier expanded Writing,
  Translations or Mentors modules. The user-supplied WeChat original remains
  external. Existing translations' individual rights boundaries are unchanged.
- Institutions represent the author's education/work trajectory, not partners,
  sponsors or endorsements. Requested names are confirmed by the user and card.
  Huadong Medicine job title/dates remain unconfirmed and are not fabricated.
- The source July 2026 CV is not republished. No private phone, HR record or
  internal project identifier is added. The postdoc start date is not inferred.

## Official institution destinations checked

- Zhejiang University: https://www.zju.edu.cn/english/
- UCLA: https://www.ucla.edu/
- UC Irvine: https://uci.edu/
- Westlake University: https://www.westlake.edu.cn/
- Hengrui: https://www.hengrui.com/index.html
- Huadong Medicine: https://www.eastchinapharm.com/ (official-domain search
  result verified; direct homepage retrieval failed in the web tool).
- IQVIA / Kuntuo: https://www.iqvia.com/zh-cn/locations/china/about-iqvia-china
  (official page explicitly describes Kuntuo).

## Visual decisions

- Reuse the author-approved avatar, original ink landscape and business card.
- Draw navy, ivory and muted gold from the card; retain Ink & Paper / Day / Night.
- Add a code-native decorative stochastic trajectory/orbit, not an empirical
  plot, and do not attach research-result meaning to it.
- Research questions and three editorial threads precede annotated featured
  works. Publications introduces the same themes before the complete record.
- Seven accessible text buttons link to institutions, avoiding a fabricated
  partner-logo wall. The old template repository is not modified.

## Verification

- Production-style Jekyll build passed. The source remains on
  `polish/live-scholar-20260917`; no push or deployment was performed.
- `ruby scripts/check-site.rb _site-preview`: 10 main pages and 284 local
  link/asset references pass, with heading, anchor and bibliography checks.
  All 38 generated HTML files were scanned for obsolete student/expected-degree
  language, known template placeholders and duplicate IDs; no matches found.
- All 22 declared legacy aliases resolve to the intended destination and include
  canonical URLs and `noindex`. Alias URLs are absent from the XML sitemap.
  These are static HTML/JavaScript redirects, not server-side HTTP 301 responses.
- Browser-tested `/_pages/cv.html` → `/cv/` (current Postdoctoral Researcher,
  no expected-degree language), and `/year-archive/` → `/writing/` (real essay).
  Local HTTP check confirms `/files/CV.pdf` returns 404.
- `node scripts/check-style.cjs` passes: all three appearances, pre-paint defaults,
  persistence, legacy preference migration, shareable mode URLs, invalid values,
  blocked storage and absent controls. `git diff --check` passes.
- Actual browser review at 1440 × 1000, 390 × 844 and 320 × 844. Home and
  Publications have no horizontal overflow. All checked homepage images load.
  Saved screenshots: [desktop home](review-2026-09-18/home-desktop-1440.png),
  [full home](review-2026-09-18/home-full-desktop-1440.png),
  [mobile home](review-2026-09-18/home-mobile-390.png),
  [publications](review-2026-09-18/publications-desktop-1440.png), and
  [institutions](review-2026-09-18/institutions-desktop-1440.png).
- Iterated after finding desktop gaps leaking into the mobile navigation and a
  rotated avatar ring causing 3 px of overflow. Both are corrected. Corrected
  double-counted scroll offsets; a mobile theme/paper anchor now lands at about
  194 px, below the 150 px sticky navigation, not underneath it.
- Browser-tested homepage theme links → correct Publications theme; theme
  representative-work links → correct full bibliography record. All 28 original
  records retain their titles, authors, years, status and source links.
- Keyboard: Tab reveals a visible skip link; Return focuses `main`; institution
  links are sequentially keyboard reachable with a visible 2 px focus outline.
- Browser-tested Ink / Day / Night controls and cross-page persistence.
  Computed base foreground, muted and accent contrast ratios on the respective
  page backgrounds are 13.13/5.81/5.48 (Ink), 13.34/6.23/7.26 (Day), and
  14.49/8.99/8.96 (Night). These sampled text pairs exceed 4.5:1; this is not a
  blanket WCAG certification for every image, hover state or third-party page.
- Reduced-motion CSS rules were inspected in the browser: smooth scrolling and
  transitions are disabled. No autonomous animation was introduced. OS-level
  reduced-motion emulation and physical-device/screen-reader tests were not run.
- No browser warnings/errors in the tested page session. Official destinations
  were checked as recorded above, but not every third-party paper endpoint was
  revisited; Huadong's homepage fetch remains unverified beyond its official
  domain search result. No access restriction was bypassed.

## Follow-up content needed

### Compact Mentors and direct styling credit — author follow-up

- Mentors now displays seven compact rows: name/reference, academic context and
  one English recollection with its Chinese original. Repeated headings and the
  duplicate index are removed; optional future essays use native disclosure.
- Homepage Friends promotion is replaced by “Special thanks to Yating Zou for
  the styling of this website.” Her name links directly to her personal site.
  The independent Friends page and navigation remain unchanged.
- Build and checks pass: 10 main pages, 274 local link/asset references,
  22 legacy aliases and the existing appearance tests. Desktop and 390 px phone
  browser review passed. Screenshots are saved as
  `review-2026-09-18/mentors-compact-desktop.png` and
  `review-2026-09-18/mentors-compact-mobile.png`.
- Still local only; no push or deployment.

### External Links and one-button appearances — author follow-up

- Renamed Friends to **External Links** in the navigation, page title, footer
  and sitemap. The existing `/friends/` address remains valid; Yating's personal
  acknowledgement and the direct homepage styling credit are unchanged.
- Replaced the dropdown with a 44 × 44 px icon button. Each click cycles
  Ink & Paper → Day → Night → Ink & Paper. The icon identifies the current mode;
  the tooltip and accessible name identify the next mode. Saved preferences and
  existing appearance URL parameters stay synchronized.
- Actual browser checks passed at 1440 px desktop and 390/320 px mobile widths:
  full navigation labels fit, no horizontal overflow, three clicks complete the
  cycle, Enter/Space operate the button, keyboard focus is visible and reload
  preserves the selected mode. The viewport override was reset afterwards.
  Mobile screenshots: `review-2026-09-18/external-links-cycle-mobile.png` and
  `review-2026-09-18/external-links-cycle-320.png`.
- Static checks pass for 10 main pages, 274 local link/asset references and
  22 legacy aliases. Button tests cover two cycles, labels, storage failures,
  legacy preferences and appearance query parameters.
- Logo recommendation: **option 5**, the navy calligraphic name with an ivory
  background and small red seal. This is a selection only; no supplied logo
  asset was processed or substituted on the site in this follow-up.
- Still local only; no push or deployment.

### Pending content

If a Talks section is desired, obtain each real talk's approved title, venue,
date, short abstract and a public/cleared slides or video URL. Do not use local
private slides as publication authorization. Huadong title/dates need author
confirmation before expanding the CV.
