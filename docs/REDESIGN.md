# Minimal academic redesign — 2026-09-16

## Design

The requested visual reference is [Yating Zou's site](https://yatingz205.github.io/)
([source](https://github.com/yatingz205/yatingz205.github.io), reference commit
`2876deda78bf33358814dcc20d8ef1b630c31a65`).

This implementation follows its restrained academic layout: a 930 px reading
column, a thin top navigation, a left-aligned introduction beside a right-aligned
portrait, modest blue links, compact bibliography entries, and a light/dark toggle.
It is written locally in plain CSS, Liquid, and JavaScript, without adopting
the reference site's personal text, photos, CV, tracking IDs, or remote theme.
No third-party fonts or JavaScript CDNs are required for the redesigned shell.
The existing AcademicPages / Minimal Mistakes MIT license remains in LICENSE.

## Content and provenance

- The author explicitly chose the second supplied image, an illustrated avatar.
  It is copied byte-for-byte to `assets/images/elvis-avatar.png`; the first image
  is not used by the new pages. The previous assets, PDF CV, and legacy URLs are retained.
- The author confirmed that he is now a postdoctoral researcher, not a PhD student.
- The public research affiliation follows the author's latest correction:
  Qian Lab, Center for Interdisciplinary Studies, School of Science, Westlake University.
  This website description does not amend the previously supplied formal affiliation
  for postdoctoral paper submissions (Institute of Natural Sciences, Westlake
  Institute for Advanced Study).
- The author-supplied two-sided business card is copied without modification to
  `assets/images/elvis-business-card.png`, displayed below the selected papers,
  and offered as a full-resolution image/download.
- The current introduction mentions Hong Qian and the author's FCS/statistics work.
- The author supplied the WeChat public-account name “让统计再次伟大”. Home
  includes its name and bilingual search-to-follow instructions. No verified
  public URL or QR code was supplied; no personal WeChat ID, private dashboard,
  speculative link, or generated QR code is published.
  No private lab files, unpublished manuscripts, HR documents, or contact numbers
  were copied from the local Westlake archive.
- The legacy PDF CV remains unchanged. The HTML CV distinguishes its current
  appointment and completed Ph.D. from historical experience details, and links
  to the current bibliography instead of repeating obsolete publication statuses.
- The bibliography now contains 28 entries: 10 journal/conference articles,
  16 preprints/working papers, and 2 long-form works. Companion preprints of
  published articles are links within the corresponding article entry.
- Current titles, author order/name variants, first-posting years, and revision
  notes follow primary public records. The source ledger and editorial decisions
  are documented in `docs/PUBLICATIONS_AUDIT.md`; this is not a claim that every
  unindexed or unpublished work has been found.

## Editing

| Content | File |
| --- | --- |
| Introduction | `_pages/about.md` |
| Selected papers and bibliography | `_data/papers.yml` |
| Online CV | `_pages/cv.md` |
| Existing PDF CV | `files/CV.pdf` |
| Business card | `assets/images/elvis-business-card.png` |
| WeChat public-account name | `_config.yml` → `author.wechat_public_account` |
| Navigation | `_data/navigation.yml` |
| Layout and spacing | `assets/css/academic.css` |
| Theme behavior | `assets/js/academic-theme.js` |

Use `selected: true` to show a paper on the homepage. Give every entry a unique
`id`. Use `category: article`, `category: preprint`, or `category: longform`
to choose its section. Verify author order, year, venue,
and publication status before editing. Never infer acceptance from a preprint.

## Build and verification

The site remains compatible with the existing GitHub Pages Jekyll deployment
from the repository's `master` branch; no Pages settings change is required.
With a current Ruby and Bundler:

```sh
bundle install
bundle exec jekyll build
bundle exec jekyll serve --host 127.0.0.1
node scripts/check-theme.cjs
ruby scripts/check-site.rb _site
```

The site checker uses Nokogiri. Screenshots and local build outputs should not be
committed. The QA record is in `docs/QA.md`.

## Rollback

Pre-redesign commit: `f689b6bc0d03bd2f6780972998bbb05fab84bb0e`.
Changes are developed on `redesign/minimal-academic-20260916`. Revert the redesign
commit with `git revert` if needed; do not reset or force-push the shared branch.
