# Light scholarly polish — 17 September 2026

## Scope and isolation

The author clarified that the target is `https://elviscuihan.github.io/`, with
only a slight classical/scholarly feel, capitalized navigation and improved
typography. The author explicitly selected local preview only.

- Worktree: `ElvisCuiHan.github.io-live-polish`
- Branch: `polish/live-scholar-20260917`
- Baseline: `origin/master`, commit `80073ad`
- Preview: <http://127.0.0.1:4017/>
- No commit, push, deployment, domain or permission change in this iteration.
- Earlier full-redesign worktree and its uncommitted work are untouched.
- No changes to UNC–UCLA, Qian Lab, course repositories or source PDFs.

## Design decisions

1. Retain the existing academic layout, introduction/round-portrait pairing,
   publication list, personal card and legacy routes.
2. Apply a small CSS overlay: paper white, ink green, warm brown accents,
   Georgia/serif headings and Songti for the original Chinese essay title.
3. Use `About / Publications / CV / Writing` in the primary navigation.
4. Keep English UI and prose. Chinese proper names and the essay's original
   title are not relabeled as an invented English title.
5. Offer Ink & Paper and Minimal styles without changing the content;
   preserve the separate light/dark preference and reduced-motion handling.
6. Add a restrained editorial essay row, not a large card grid or hero remake.

## Content sources and limits

### Essay

The user supplied the title, authorship and original URL for
**《鞅的辉煌与苦难》**:
<https://mp.weixin.qq.com/s/hAIXft_2gpk3P9Mvs0X_RQ>.

The homepage and `/writing/` both link directly to that exact URL. WeChat could
not be loaded reliably by the available browser/web tools, so the article's
body, byline on-platform and publication date were not independently inspected.
No date, detailed summary, full-text transcription or image republication was
added. The short English description merely directs readers to the original.

Earlier candidate PDFs in `mtg_推文` were checked and rejected: they were
*Martingales in Survival Analysis* by other authors and a machine translation,
not the user's essay. None was copied into the website.

### CV and bibliography

The web CV carries forward the previous local iteration's English rendering
based on the author's supplied July 2026 CV, personal card and confirmed current
appointment. It retains the unresolved-detail note: LinkedIn's full profile
was inaccessible, the postdoctoral start month is not inferred, and the
Huadong Medicine role still needs a title and dates. Private phone numbers and
internal project identifiers are omitted. The source PDF is unchanged.

The existing 28-entry bibliography is unchanged by this light-polish iteration.
No new institutional affiliations, publications or collaborations were invented.

## Verification performed

- Local Jekyll build succeeded using the existing Ruby/gem environment.
- `check-site.rb`: 8 pages and 168 local links/assets passed.
- Style-selector and theme-script tests passed.
- `git diff --check` passed.
- Browser screenshots inspected at 1440px desktop, 390px mobile and 320px
  narrow mobile widths. Checked homepage, Writing, and mobile CV.
- Checked horizontal overflow on desktop homepage, 390px homepage and 320px
  Writing/Publications: scroll width equaled viewport width.
- Actually navigated About → Writing, About → CV, and keyboard-navigated to
  Publications with Tab and Enter. Keyboard focus showed a visible 2px outline.
- Switched Ink & Paper ↔ Minimal, navigated between pages and confirmed the
  selection persisted. Switched light/dark and confirmed it persisted separately.
- Article title and Read Original links expose the exact user-supplied URL.
- No console warnings or errors were reported during the tested interactions.

## Not yet verified / not included

- End-to-end opening of the WeChat article: platform loading failed; no
  restriction was bypassed.
- Full assistive-technology audit, print-dialog/PDF output QA, every legacy
  page at every breakpoint, and a fresh check of all external scholarly links.
- Production GitHub Pages build, because this remains a local-only preview.
- No article translation or full-text migration; request the author's original
  manuscript if a hosted reading page is desired later.

## Local build used on this Mac

The existing Ruby 2.6-compatible gem environment was reused without dependency
installation; the unused gist plugin was omitted only in this local invocation.
Production configuration was not changed.

```sh
env GEM_HOME=/private/tmp/elvis-jekyll-gems \
GEM_PATH=/private/tmp/elvis-jekyll-gems:/Library/Ruby/Gems/2.6.0 \
JEKYLL_NO_BUNDLER_REQUIRE=true \
ruby -rjekyll -e 'Jekyll::Site.new(Jekyll.configuration({"source"=>Dir.pwd,"destination"=>"_site-preview","plugins"=>["jekyll-paginate","jekyll-sitemap","jekyll-feed","jekyll-redirect-from"]})).process'
python3 scripts/serve-preview.py
```
