# Chinese reading editions — 2026-09-17

## Scope and display

Requested for Elvis Han Cui's personal website, not the Qian Lab website or
course repository. Local preview only; no push, deployment or access changes.

Eleven entries are in `_data/translations.json`: Wasserstein Regression plus the
ten previously catalogued projects from the private `life-at-westlake` repository.
The personal collection is attributed to Elvis; original authors remain credited
separately. No sole-translator credit, endorsement or formal publication status
is invented. Years identify original works, not translation completion dates.
Chinese titles remain in Chinese within the English interface.

The homepage and Writing share `_includes/translations-preview.html`. The full
page at `/translations/` has a leading Wasserstein entry and three subject shelves.
The decorative Wasserstein panel is new HTML/CSS typography, not an official book
cover or copied publisher art. Nothing from the source paper's figures is reused.

## Wasserstein: identity, version and access

- Original: Yaqing Chen, Zhenhua Lin and Hans-Georg Müller, *Wasserstein
  Regression*, JASA 118(542), 869–882 (2023).
- DOI: <https://doi.org/10.1080/01621459.2021.1956937>
- Author preprint: <https://arxiv.org/abs/2006.09660>
- Bibliography cross-check: <https://www-stat.ucdavis.edu/~mueller/publications24.html>
- Local project: `/Users/elviscui/Downloads/WassersteinPaper/09_yaqing_chen_wasserstein_regression_中文译注`.
- Read the project's README, QA report and SHA256SUMS; examined the first two PDF
  pages as text and rendered images. This is not a fresh full-document QA.
- Current 32-page file: `03_output/Chen_Lin_Muller_Wasserstein之回归_中文译注.pdf`.
- SHA256: `5be936b1e7d7915e56545d44438d2c9695e0f26eee79c08f2fa1302b0587a078`.
- This matches the final hash in SHA256SUMS, although the README's final filename
  is stale. The similarly named older 2,800,660-byte edition is not the current
  version. The current file is 2,810,315 bytes.
- It contains chapter guides, terminology and statistical-history notes; its
  own version page says it is unofficial, unapproved and for internal study.
- **Metadata and original-source links only. No translated PDF is copied into
  this website.** Its existence as a local manuscript or arXiv submission package
  is not treated as evidence of publication or redistribution permission.

## Existing ten-entry catalogue

Source: `/Users/elviscui/Downloads/西湖大学-临时访问/06_COURSES_课程教学/life-at-westlake/translations/`.
Read `catalogue.json`, both catalogue READMEs, `SOURCE_REVIEW.md`, the Advani entry
README and the Elvis works manifest. Their September 15 source audit is carried
forward; the other nine translations have not been newly checked page by page.

| Project | Website access |
| --- | --- |
| Wigner — The Unreasonable Effectiveness of Mathematics | Metadata; original DOI |
| Breiman — Statistical Modeling: The Two Cultures | Main-article translation metadata; original DOI |
| Qian — Brownian Ratchet (2004) | Internal-study catalogue; original DOI |
| Nasar & Gruber — Manifold Destiny | Metadata; original New Yorker article |
| Cole & Qian — The Brownian Ratchet Revisited | Internal-study catalogue; original DOI |
| Axelrod et al. — FRAP reminiscences | Metadata; original DOI; photos not mirrored |
| Advani, Saxe & Sompolinsky — Generalization error | Chinese PDF, attribution and CC BY 4.0 |
| Tao — Mathematics in the age of AI | Metadata; author's English slides |
| Kratsios / OSTP — Science: A New Golden Age | Metadata; original government report site, not Science journal |
| Singh et al. — Multi-omics and AI target identification | Metadata; original DOI; ND adaptation-sharing permission unresolved |

### Hosted PDF: Advani–Saxe–Sompolinsky

- Original: *Neural Networks* 132 (2020), 428–446.
- DOI: <https://doi.org/10.1016/j.neunet.2020.08.022>
- Original license evidence: <https://pmc.ncbi.nlm.nih.gov/articles/PMC7685244/>.
  Direct browser opening presented a verification page; primary search results
  confirmed the CC BY 4.0 text. No verification challenge was bypassed.
- License: <https://creativecommons.org/licenses/by/4.0/>.
- Translation: 39 pages, dated September 7, 2026; the version page retains original
  authorship and credits Codex-assisted translation, typesetting and checking.
- Changes: Chinese translation, notes, reading guides, glossary, cover illustration
  and layout. The edition itself states CC BY 4.0 for the new material.
- Local source: `translations/2020-advani-generalization/advani-saxe-sompolinsky-2020-zh.pdf`
  in the private course repo above. Copied byte-for-byte, never edited.
- Website copy: `files/translations/advani-saxe-sompolinsky-2020-zh.pdf`.
- SHA256: `cb9ba63dc0e0bfecdfe0645d98f32be63ea449792edcf5c4bc8112cdab6c471e`.
- First two pages rendered and visually inspected in this pass; all-page review
  belongs to the earlier source audit, not this turn. The existing PDF is not
  tagged for accessibility; no PDF remediation was performed.

## Maintenance boundaries

Adding a data row creates an entry, not a right to upload its manuscript.
Only `status: hosted-translation` entries with reviewed permission should have
a `pdf` URL. Keep source authors, source links, edition attribution and changes.
Do not place local absolute paths or private source documentation in rendered
HTML; this docs directory is excluded from the build.

## Verification

- Jekyll build passed. The site checker passed 10 pages and 243 local links/assets,
  with additional assertions for all 11 catalogue IDs, original-author credits,
  source links, restricted-entry download boundaries and the hosted PDF hash.
- Style/theme preference tests and `git diff --check` passed.
- Inspected actual browser screenshots of the new page at 1440px and 390px, the
  catalogue at 320px in Minimal/dark, and the homepage reading module at 1440px.
  Inspected Writing at 390px and corrected the new section's heading level.
- No horizontal overflow at 1440px, 390px or 320px in the inspected layouts.
- Tested top navigation, Writing entry, homepage Wasserstein deep link, subject
  anchors, Tab/Enter and the native attribution disclosure. Focus shows a 2px
  outline. At 390px, the statistics anchor starts at about 149px while the sticky
  header ends at about 103px, leaving the heading unobscured.
- Tested Ink & Paper / Minimal and light/dark; restored Ink & Paper and light.
  Existing reduced-motion CSS disables smooth scrolling and transitions.
- Calculated light-theme contrast: muted text 5.41:1, accent links 6.26:1,
  decorative book-panel text 7.56:1 against their respective backgrounds.
- The Chinese PDF link navigates to the correct resource. HTTP 200,
  `application/pdf`, 4,246,240 bytes and SHA256 all match the reviewed file.
  The in-app browser displayed a blank dark PDF-viewer area, so successful
  *in-browser PDF rendering* is **not** claimed. The local source's first two
  pages were separately rendered with Poppler and visually inspected.
- Rendered page HTML does not contain local absolute source paths. The `docs`
  directory is excluded from the generated website.
- Not performed: full PDF remediation, fresh page-by-page audit of all translated
  editions, complete external-link validation, screen-reader or cross-browser
  audit. Source licenses have been inspected, not legally adjudicated.
- No commit, push, production deployment, source-directory reorganization or
  modification of the course repository was performed.
