# Elvis Han Cui · Academic website

Personal academic website: [elviscuihan.github.io](https://elviscuihan.github.io/).

**Research banner update (2026-09-19):** the author-selected landscape is now
the homepage hero. Desktop displays the complete supplied image with native
Research / Publications links over its painted buttons. Smaller screens have
readable HTML headings and buttons alongside a CSS-framed detail of the same
image; the complete artwork is always available. The former large navy question
panel is replaced by the banner, and its research statement is preserved above
the three themes. Avatar, logo, paper selections and the three appearances stay
unchanged. See [banner release notes](docs/RELEASE_BANNER_2026-09-19.md).

The local **Research-first edition (2026-09-18)** reorganizes the homepage around
research questions, three connected themes, annotated featured papers and the
personal card. A navy / ivory / muted-gold palette connects the site to the card;
the original ink landscape, illustrated avatar and independent pages remain.
The publications page introduces the same research threads before the complete
28-record bibliography. In the latest local refinement, **External Links** contains
only one “Thanks, Yating Zou” button for the website styling. The institutional
directory is no longer rendered. A later refinement adds a small
Yating Zou styling credit beneath the homepage navigation and reduces the
Writing preview to a heading and one essay link. The author authorized publishing
these changes, Jessica Li's JSB link and the new reading pages/buttons on
**2026-09-18**. See [reading release checks](docs/RELEASE_READING_BUTTONS_2026-09-18.md).
The archived institution data and images are preserved for optional future reuse.
The author authorized publication of this simplification, the logo family,
English-only display name and eight-person Mentors update on **2026-09-18**.
See [the refinement release scope and verification](docs/RELEASE_REFINEMENT_2026-09-18.md).

**Previous research-first edition: publication authorized by the author on
2026-09-18**; this edition is prepared for the existing `master`-based GitHub Pages
release. See [release scope and verification](docs/RELEASE_2026-09-18.md).
See [the design, sources, route cleanup and QA](docs/RESEARCHER_EDITION_2026-09-18.md).
Earlier local-only notes record the state at their writing; today's explicit
“Push” authorization supersedes those publication holds, not the recorded QA
limitations or third-party rights notices.

One icon button in the header cycles through three appearances:
**Ink & Paper** (classical ink landscape), **Day** (clean white), and **Night**
(clean dark), then back to Ink & Paper. Click it or use Enter/Space when focused;
the tooltip names the current and next modes. Your choice is saved across pages
and reloads. The landscape is
decorative, appears only in Ink & Paper, and is omitted from print.
Use `/?appearance=ink` to open the landscape directly, or `?appearance=day`
and `?appearance=night` for the other appearances. Clicking the button updates
an existing appearance parameter, so a later reload respects the new choice.

**Previous edition: release authorized by the author on 2026-09-17.** It was developed in
a separate worktree on `polish/live-scholar-20260917`, based on `origin/master`
at `80073ad`. GitHub Pages publishes `master` at the repository root. The earlier
full-redesign worktree is unchanged. Historical local-only review notes below
describe the pre-release stages; this authorization supersedes their release hold.

## Maintain the site

- Introduction: `_pages/about.md`
- Homepage banner: `_layouts/about.html`, `assets/css/research-banner.css`, and the unchanged author-supplied `assets/images/research-landscape-banner.png`. The wide-screen link positions depend on this exact image; update and retest them if replacing the artwork.
- Display name: English-only “Elvis Han Cui” in the shared header and homepage title; Chinese personal-name labels are temporarily removed, while other Chinese content is unchanged.
- Publications: `_data/papers.yml` (`selected: true` marks the homepage shortlist)
- Homepage selected-publication order, real first-page thumbnails, venue labels and optional overviews: `_data/featured.yml` (must match selected paper IDs; order is independent of the full bibliography)
- Selected work: scGTM → The Statistical Compass → Investigating the value of glucodensity. Thumbnail sources and preview limitations: `docs/SELECTED_PUBLICATIONS_2026-09-18.md`
- Research themes, questions and representative paper links: `_data/research.yml`
- Archived education/work-history logo directory (not rendered): `_data/institutions.yml` and `_includes/institution-links.html`
- Web CV: `_pages/cv.md`; print this page to save a current PDF
- Writing page: `_pages/writing.md`
- Featured essay: `_includes/featured-essay.html` (Writing page)
- Reading catalogue: `_data/translations.json` (source authors and per-entry access status)
- Translations page: `_pages/translations.html`; Writing entry module: `_includes/translations-preview.html`
- Online reading pages: `_pages/reading-*.md`; shared layout: `_layouts/reading.html`. Native link-buttons distinguish Chinese reading, original PDF and DOI. Source metadata uses a keyboard-accessible disclosure.
- Mentor names, sources and recollections: `_data/mentors.yml`
- Mentors page: `_pages/mentors.html` (eight name-only disclosure buttons, collapsed by default, with always-visible reference links)
- Previous extended acknowledgement text (not rendered): `_data/friends.yml`
- External Links page and single styling-thanks button: `_pages/friends.html` (top navigation and footer; original `/friends/` URL preserved)
- Small homepage styling credit (under navigation, right-aligned): `.home-styling-credit` in `_layouts/about.html` and `assets/css/researcher.css`; the larger External Links button remains independent.
- Compact homepage Writing row: `.research-notes` in the same layout and stylesheet. The original essay and translations remain on the Writing page.
- WeChat editorial card and avatar viewport: `_layouts/about.html`, `assets/css/researcher.css`
- Author-supplied public WeChat profile screenshot: `assets/images/wechat-account-profile.png`; provenance: `docs/WECHAT_CARD_2026-09-18.md`
- Copy-account-name behavior: `assets/js/scholar.js`; check with `node scripts/check-scholar.cjs`
- Current logo selection: `assets/images/elvis-landscape-logo.png` in the header; `assets/images/elvis-seal-logo.png` as favicon. The unchanged bamboo variant is reserved for future article covers, and the phoenix is retained as an alternate. See `docs/LOGO_FAMILY_2026-09-18.md` for provenance; publication is covered by the refinement release above.
- Personal/institutional image provenance and local-preview limits: `docs/LOGO_DIRECTORY_2026-09-18.md`
- Navigation: `_data/navigation.yml`
- Base styling: `assets/css/academic.css`
- Light-polish overlay: `assets/css/scholar-polish.css`
- Research-first visual system: `assets/css/researcher.css`
- Legacy URL redirects: canonical pages' `redirect_from` lists, rendered by `_layouts/redirect.html`
- Three-mode appearance cycle button: `assets/js/academic-style.js`
- Legacy two-mode script (no longer loaded): `assets/js/academic-theme.js`
- Generated landscape: `assets/images/ink-landscape-v1.jpg` (web asset); PNG is the uncompressed source

The English web CV carries forward the previous local review's July 2026 CV and
personal-card work. Unconfirmed job dates/titles are tracked in the edition's
content notes, not displayed as CV facts. The historical `files/CV.pdf` is
preserved locally but excluded from the generated site. Use the web CV's print
button for a current PDF. The standalone legacy CV HTML redirects to `/cv/`.

The essay **《鞅的辉煌与苦难》** links to the author's supplied WeChat original.
Its full text and images are not mirrored; no publication date or summary has
been invented.

The **Mentors** page has eight teachers, ordered by Zhejiang University, UCLA,
then Westlake, with Gang Li after Weng Kee Wong. English recollections and
Chinese originals are preserved. These are personal memories, not a formal
advisor roster or third-party quotations. Add author-approved longer pieces to
each entry's optional `essay_paragraphs` list; longer pieces open in a disclosure.
The default view shows eight name buttons and a separate “Link ↗” beside each.
Selecting a name reveals its bilingual recollection and academic context.
Reference links are usable without opening a recollection and have accessible
labels naming their source. Native details/summary keeps
the content usable without JavaScript. Keep IDs unchanged so existing
links continue to work. See [mentor content notes](docs/MENTORS_CONTENT.md).

The homepage includes one compact Writing entry. Expanded translations and
mentor recollections remain on their independent pages. Empty Talks and Blog
archives redirect to Writing; they are no longer promoted in navigation.
Past Teaching entries remain clearly labeled as historical appointments.

**Translations & Notes** is linked from Writing. It contains fourteen
unofficial Chinese reading projects, led by *Wasserstein Regression*. The
Advani–Saxe–Sompolinsky edition has a CC BY 4.0 Chinese PDF; ten entries
provide metadata and original-source links only. Three new online Chinese
readings cover AI drug discovery: the Bender perspective, Ren's TNIK discovery
study, and Xu's phase 2a trial. Only Ren's abstract and final Discussion paragraph
are translated (CC BY 4.0); the other two are short original reading guides,
not translations. The new AI-assisted drafts are marked as awaiting Elvis's
review. See [source and rights checks](docs/AI_DRUG_DISCOVERY_READINGS.md).
Do not copy restricted PDFs
into the site when adding a catalogue entry. See [translation source and access
notes](docs/TRANSLATIONS_CONTENT.md), including version hashes and attribution.

## Preview and verify

Use a current Ruby (3.2+) and Bundler:

```sh
bundle install
bundle exec jekyll build --destination _site-preview
python3 scripts/serve-preview.py
```

Open [the local preview](http://127.0.0.1:4017/). The server binds to loopback
only and disables caching. Stop it with `Ctrl+C`; rebuild after source edits,
then refresh the browser. A Python server serves the generated static website;
the website itself uses Jekyll, HTML, CSS and JavaScript, not Streamlit or PHP.
Do not open `_layouts/about.html` directly: that is a Liquid source template,
not the rendered website. Local redirects stay on the preview host; published
canonical URLs point to the GitHub Pages domain.

```sh
node scripts/check-style.cjs
node scripts/check-scholar.cjs
ruby scripts/check-site.rb _site-preview
git diff --check
```

The site checker uses Nokogiri. Keep build output out of Git.
GitHub Pages continues to deploy the `master` branch at the repository root.
Only publish future revisions with the author's approval.

See [light-polish review and QA](docs/LIGHT_POLISH_2026-09-17.md) for this
iteration's scope, verified interactions and remaining limitations.

See [redesign notes](docs/REDESIGN.md) for source verification, editing details,
and rollback instructions, and [QA](docs/QA.md) for the verification record.

## Credits

Special thanks to [Yating Zou](https://yatingz205.github.io/) for the styling
inspiration. The External Links page carries one concise acknowledgement button
linking directly to her site. At the author's request, the homepage also has a
small, right-aligned text credit, rather than a repeated acknowledgement block.

The homepage publication list takes organizational cues from
[Arash A. Amini's site](https://faculty.stat.ucla.edu/arashamini/):
compact bibliographic rows, venue/year markers and separate resource links.
All paper data, summaries and links remain the author's existing verified records.

The landscape was generated with the built-in imagegen tool for this website.
See [the prompt, asset record, and QA](docs/INK_LANDSCAPE_2026-09-17.md).

The original site is based on [AcademicPages](https://github.com/academicpages/academicpages.github.io)
and Michael Rose's Minimal Mistakes theme, under the existing [MIT license](LICENSE).
The redesign is a local implementation inspired by the reference site's layout;
it does not copy its personal content or depend on its remote theme.
