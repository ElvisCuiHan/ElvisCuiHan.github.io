# Elvis Han Cui · Academic website

Personal academic website: [elviscuihan.github.io](https://elviscuihan.github.io/).

This edition adds a light scholarly finish to the academic website:
original ink-wash landscape backgrounds, ink-green text, warm accents and serif headings.
The existing introduction, round portrait, compact bibliography and independent
pages are retained. The header offers three explicit appearances:
**Ink & Paper** (classical ink landscape), **Day** (clean white), and **Night**
(clean dark). Your choice is saved across pages and reloads. The landscape is
decorative, appears only in Ink & Paper, and is omitted from print.
Use `/?appearance=ink` to open the landscape directly, or `?appearance=day`
and `?appearance=night` for the other appearances. Switching the menu updates
an existing appearance parameter, so a later reload respects the new choice.

**Release authorized by the author on 2026-09-17.** This edition was developed in
a separate worktree on `polish/live-scholar-20260917`, based on `origin/master`
at `80073ad`. GitHub Pages publishes `master` at the repository root. The earlier
full-redesign worktree is unchanged. Historical local-only review notes below
describe the pre-release stages; this authorization supersedes their release hold.

## Maintain the site

- Introduction: `_pages/about.md`
- Publications: `_data/papers.yml` (`selected: true` displays an entry on the homepage)
- Web CV: `_pages/cv.md`; print this page to save a current PDF
- Writing page: `_pages/writing.md`
- Featured essay: `_includes/featured-essay.html` (Writing page)
- Reading catalogue: `_data/translations.json` (source authors and per-entry access status)
- Translations page: `_pages/translations.html`; Writing entry module: `_includes/translations-preview.html`
- Mentor names, sources and recollections: `_data/mentors.yml`
- Mentors page: `_pages/mentors.html` (accessible from the main navigation)
- Friends and personal acknowledgements: `_data/friends.yml`
- Friends page: `_pages/friends.html` (top navigation, footer, and a short homepage entry)
- Navigation: `_data/navigation.yml`
- Base styling: `assets/css/academic.css`
- Light-polish overlay: `assets/css/scholar-polish.css`
- Three-mode appearance selector: `assets/js/academic-style.js`
- Legacy two-mode script (no longer loaded): `assets/js/academic-theme.js`
- Generated landscape: `assets/images/ink-landscape-v1.jpg` (web asset); PNG is the uncompressed source

The English web CV carries forward the previous local review's July 2026 CV and
personal-card work. Unconfirmed details remain flagged in the page's editorial
note. The historical `files/CV.pdf` is preserved unchanged, not presented as the
current CV download.

The essay **《鞅的辉煌与苦难》** links to the author's supplied WeChat original.
Its full text and images are not mirrored; no publication date or summary has
been invented.

The **Mentors** page preserves the author's seven-person order, with English
recollections and Chinese originals. These are personal memories, not a formal
advisor roster or third-party quotations. Add author-approved longer pieces to
each entry's optional `essay_paragraphs` list. Keep IDs unchanged so existing
links continue to work. See [mentor content notes](docs/MENTORS_CONTENT.md).

The homepage omits Writing, Translations and Mentors previews to keep the page
focused. Their content remains intact on independent pages.

**Translations & Notes** is linked from Writing. It contains eleven
unofficial Chinese reading projects, led by *Wasserstein Regression*. The
Advani–Saxe–Sompolinsky edition has a CC BY 4.0 Chinese PDF; the other ten entries
provide metadata and original-source links only. Do not copy restricted PDFs
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

```sh
node scripts/check-style.cjs
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

An enormous thank-you to [Yating Zou](https://yatingz205.github.io/) for the
styling inspiration behind this website: its clean layout, thoughtful spacing
and quiet academic character. A personal acknowledgement and friendly external
link appear on the independent **Friends** page. This credit identifies visual
inspiration, not a claim that Yating implemented or endorses this website.

The landscape was generated with the built-in imagegen tool for this website.
See [the prompt, asset record, and QA](docs/INK_LANDSCAPE_2026-09-17.md).

The original site is based on [AcademicPages](https://github.com/academicpages/academicpages.github.io)
and Michael Rose's Minimal Mistakes theme, under the existing [MIT license](LICENSE).
The redesign is a local implementation inspired by the reference site's layout;
it does not copy its personal content or depend on its remote theme.
