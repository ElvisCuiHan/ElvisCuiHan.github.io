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
- Formal affiliation follows the author's supplied postdoc wording:
  Institute of Natural Sciences, Westlake Institute for Advanced Study.
- The current introduction mentions Hong Qian and the author's FCS/statistics work.
  No private lab files, unpublished manuscripts, HR documents, or contact numbers
  were copied from the local Westlake archive.
- The detailed legacy CV and its PDF are not silently rewritten. The CV page
  distinguishes its current appointment from the historical details below.
- The bibliography is a selection migrated from the public CV, not a claim of
  completeness. Old work-in-preparation descriptions remain in the CV.
- Publication metadata were checked against the following primary sources:
  - scGTM: https://pmc.ncbi.nlm.nih.gov/articles/PMC9991897/
  - Sea-urchin optimal design: https://doi.org/10.1007/s00204-021-03201-1
  - Inference Fusion: https://doi.org/10.1609/aaai.v35i3.16295
  - Dual Path: https://arxiv.org/abs/2112.12359
  - Projection Pursuit: https://arxiv.org/abs/1912.07602

## Editing

| Content | File |
| --- | --- |
| Introduction | `_pages/about.md` |
| Selected papers and bibliography | `_data/papers.yml` |
| Online CV | `_pages/cv.md` |
| Existing PDF CV | `files/CV.pdf` |
| Navigation | `_data/navigation.yml` |
| Layout and spacing | `assets/css/academic.css` |
| Theme behavior | `assets/js/academic-theme.js` |

Use `selected: true` to show a paper on the homepage. Use `category: article`
or `category: preprint` to choose its section. Verify author order, year, venue,
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
