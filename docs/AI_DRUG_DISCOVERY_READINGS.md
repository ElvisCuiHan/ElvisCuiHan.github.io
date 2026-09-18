# AI drug-discovery readings · 2026-09-18

Initially implemented as a local preview. The user subsequently requested
button styling and an explicit push on 2026-09-18. Publication is now authorized;
see RELEASE_READING_BUTTONS_2026-09-18.md. This supplements the historical audit in
TRANSLATIONS_CONTENT.md, not its earlier 11-entry verification counts.

## Scope

Three HTML readings, one new subject shelf, one Writing preview entry.
The original eleven catalogue records and the reviewed Advani PDF are unchanged.
Chinese bodies are labeled by scope: two short original guides, one excerpt
translation. Every page explicitly discloses AI assistance and pending Elvis
Han Cui review. No invented sole-translator or original-research attribution.
The homepage stays compact; the reading shelf remains on Writing.

## Bender et al. (2026)

- Exact requested title: Artificial intelligence in drug discovery — what it
  is, where we stand and the path forward.
- DOI: https://doi.org/10.1038/s41573-026-01496-2
- Publisher PDF: https://www.nature.com/articles/s41573-026-01496-2.pdf
- Author's free-read link: https://rdcu.be/fyr77
- Verified author post:
  https://www.drugdiscovery.net/2026/08/07/artificial-intelligence-in-drug-discovery-what-does-it-mean-and-where-do-we-really-stand/
- Normal public publisher PDF request succeeded, HTTP 200 application/pdf.
  pdfinfo reports 22 pages. No account, cookie, paywall or challenge bypass.
- Local archive:
  /Users/elviscui/Downloads/AIDD-Stuff/AIDD-Papers/2026 - Artificial intelligence in drug discovery - what it is, where we stand and the path forward.pdf
- SHA256: d4e1584ad36455246ea190a0c56413b947f194242450d6b9af21b8126a16034c
- Inspected title, abstract, introduction and exclusive-rights statement.
  Rendered and visually checked PDF pages 1 and 21.
- © Springer Nature Limited 2026. No verified open adaptation license.
  The website offers a short original Chinese guide, independent reading
  questions and external official links, not a translation or PDF mirror.
- This is the Bender perspective, not the Insilico TNIK clinical paper.

## Ren et al. (2024 online; 2025 issue)

- DOI: https://doi.org/10.1038/s41587-024-02143-0
- Local source, unchanged:
  /Users/elviscui/Downloads/AIDD-Stuff/AIDD-Papers/2025 - A small-molecule TNIK inhibitor targets fibrosis in preclinical and clinical models.pdf
- Read complete abstract, Discussion and license. Rendered and visually
  checked PDF pages 1 and 13 (printed pages 63 and 75).
- © The Author(s) 2024, CC BY 4.0. Explicitly permits adaptation with credit,
  a license link and disclosure of changes; third-party exclusions remain.
- Translated complete abstract and final Discussion paragraph only. Added
  editorial notes, terminology and edition/license disclosure. New translation
  and notes also offered under CC BY 4.0; no figures or layout reproduced.
- Keep the 18-month endpoint as preclinical candidate nomination, not clinical
  completion. Preserve healthy-volunteer phase I versus patient efficacy.
- Optimistic final paragraph is explicitly the authors' view, not site
  endorsement. The 2024/2025 date distinction is rendered on the page.

## Xu et al. (2025)

- DOI: https://doi.org/10.1038/s41591-025-03743-2
- Local source, unchanged:
  /Users/elviscui/Downloads/AIDD-Stuff/AIDD-Papers/2025 - A generative AI-discovered TNIK inhibitor for idiopathic pulmonary fibrosis _ a randomized phase 2a trial.pdf
- Read complete abstract and relevant limitation/license text. Rendered and
  visually checked PDF pages 1 and 9 (printed pages 2602 and 2610).
- © The Author(s) 2025, CC BY-NC-ND 4.0, explicitly no sharing adaptations.
- Short factual guide + independent statistical questions only, no full
  abstract translation, figures, tables, PDF mirror or adapted full text.
- Preserve n=71, 12-week follow-up, safety primary endpoint versus lung-function
  secondary endpoints, arm-level FVC change versus between-arm effect.
- Paper-date evidence only; not a claim about present regulatory status.

## Implementation and verification

- Reading sources are flat _pages/reading-*.md files with layout reading.
- The translations data separates excerpt-translation and reading-guide from
  hosted-translation. Neither new status can expose a Chinese PDF.
- External original PDF buttons point only to the publisher. The source PDFs,
  extracted text and QA renders stay outside the generated site.
- Automated tests cover three new routes, topic membership, attribution,
  scope, draft disclosures, licence boundaries, original-source links,
  related-reading links and preservation of the existing translated PDF hash.
- Initial authoring pass: browser automation timed out. The subsequent button
  release restored browser access and completed desktop/mobile screenshot and
  interaction checks; details are in the release note.
- Jekyll build passed. Site checker passed 13 routes and 366 local links/assets,
  including all 14 catalogue entries and the three new reading pages.
- WeChat and three-mode appearance unit checks passed; git diff --check passed.
- All three reading routes returned HTTP 200 from the loopback preview server.
- No full paper-by-paper scientific reproduction or legal opinion. Explicit
  publication authorization is not treated as proof of editorial review: the
  readings retain their visible AI-assisted, awaiting-review disclosures.
