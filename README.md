# Elvis Han Cui · Academic website

Personal academic website: [elviscuihan.github.io](https://elviscuihan.github.io/).

The 2026 redesign follows the clean, typography-first style of
[Yating Zou's academic homepage](https://yatingz205.github.io/): a quiet top
navigation, a two-column introduction and portrait, and a compact publication list.
It preserves the existing repository, PDF CV, assets, and legacy page URLs.

## Maintain the site

- Introduction: `_pages/about.md`
- Publications: `_data/papers.yml` (`selected: true` displays an entry on the homepage)
- CV: `_pages/cv.md`; downloadable file: `files/CV.pdf`
- Navigation: `_data/navigation.yml`
- Styling: `assets/css/academic.css`
- Theme toggle: `assets/js/academic-theme.js`

The detailed CV and PDF are historical files from the original website. Their
content should be checked before replacing them with a current CV.

## Preview and verify

Use a current Ruby (3.2+) and Bundler:

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

The site is served at `http://127.0.0.1:4000`.

```sh
bundle exec jekyll build
node scripts/check-theme.cjs
ruby scripts/check-site.rb _site
```

The site checker uses Nokogiri. Keep build output out of Git.
GitHub Pages continues to deploy the `master` branch at the repository root.

See [redesign notes](docs/REDESIGN.md) for source verification, editing details,
and rollback instructions, and [QA](docs/QA.md) for the verification record.

## Credits

The original site is based on [AcademicPages](https://github.com/academicpages/academicpages.github.io)
and Michael Rose's Minimal Mistakes theme, under the existing [MIT license](LICENSE).
The redesign is a local implementation inspired by the reference site's layout;
it does not copy its personal content or depend on its remote theme.
