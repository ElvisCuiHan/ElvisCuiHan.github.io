# Mentor recollections — 2026-09-17

The dated sections below record successive editions. The eight-person update
and publication authorization at the end supersede the earlier local-only holds.

## Editorial rules

The seven people, their order, mentorship and remembered lessons come directly
from Elvis Han Cui's request. English prose is a light translation/edit of those
notes, not a newly invented episode. Chinese notes preserve their substance;
the phrase about repeatable experiments is lightly normalized for readability.
The page explicitly distinguishes these memories from verbatim quotations and
from a formal academic-advisor list. No dates, courses, photographs or meetings
are invented. Affiliations identify the academic context; they do not assert a
present employment status for every person.

## Identity references

1. **Ping Fang / 方萍** — [Zhejiang Online, 2019-07-12](https://zjnews.zjol.com.cn/zjnews/hznews/201907/t20190712_10574696.shtml)
   identifies 方萍 as a Zhejiang University College of Environmental and Resource
   Sciences professor. [PubMed, PMID 26164271](https://pubmed.ncbi.nlm.nih.gov/26164271/)
   lists Ping Fang with the matching college and university. This matches the
   author's description. A current official faculty profile was not located;
   no current rank, retirement status or administrative role is inferred.
2. **Gaoxiang Ye / 叶高翔** — [ZJU Institute of Condensed Matter Physics](https://physics.zju.edu.cn/icmp/2020/0113/c45016a1951095/page.htm).
3. **Haoran Li / 李浩然** — [ZJU faculty profile](https://person.zju.edu.cn/0095075),
   Department of Chemistry.
4. **Weng Kee Wong** — [UCLA Fielding faculty profile](https://ph.ucla.edu/about/faculty-staff-directory/weng-kee-wong),
   Biostatistics.
5. **Dorota M. Dabrowska** — [UCLA Fielding faculty profile](https://ph.ucla.edu/about/faculty-staff-directory/dorota-m-dabrowska),
   Professor Emerita, Biostatistics. Display name follows the official spelling.
6. **Jingyi Jessica Li** — [UCLA Fielding faculty profile](https://ph.ucla.edu/about/faculty-staff-directory/jingyi-jessica-li)
   and [UCLA profile](https://profiles.ucla.edu/jingyi.li). Display name follows
   the public professional ordering, rather than “Jessica Jingyi Li”.
7. **Hong Qian / 钱紘** — [Westlake faculty profile](https://en.westlake.edu.cn/faculty/hong-qian.html),
   Interdisciplinary Studies.

References checked on 2026-09-17. Links support identity/academic context only;
they are not evidence for the author's personal recollections. Source webpages
and images are not copied into the repository.

## Future additions

- `_data/mentors.yml` is the single source for order, links and short memories.
- Add an optional `essay_paragraphs` list to a mentor only after receiving the
  author's text. The compact page shows it in an optional disclosure below the
  short bilingual memory.
- Preserve anchor IDs, even if names, translations or longer essays are revised.
- Photos require an author-provided or appropriately licensed source.
- No automatic publication: this branch remains a local-only preview.

## Checks

The site checker tests all seven stable anchors, ordering, English and Chinese
memories, homepage links and source references.

- Local build passed; the checker passed 9 routes and 211 local links/assets.
- Theme and style preference tests passed; `git diff --check` passed.
- Inspected browser screenshots of the desktop homepage section and Mentors at
  1440px, and Mentors at 390px, 320px and 768px.
- Confirmed no horizontal overflow at the tested narrow and tablet widths.
- Tested the top navigation, in-page mentor index, and homepage deep link to
  Weng Kee Wong. Tested Tab/Enter navigation in the mentor index; focus has a
  visible 2px outline.
- Corrected the anchor offset after inspection so the sticky header does not
  obscure the target: at 390px, the Dorota section began at approximately 149px,
  below the header's approximately 103px bottom edge.
- Tested Ink & Paper / Minimal and light / dark on the new page.
- Browser console reported no warnings or errors during the checked flows.
- This is not a full screen-reader, print, every-browser or external-link audit.
  No production deployment was performed.

## Compact edition — 2026-09-18

At the author's request, removed the duplicated index, large introductory deck,
per-person theme labels and repeated lesson headings. All seven teachers remain
in their original order, with stable anchors, English recollections and Chinese
notes unchanged. Names themselves now link to the same biographical references.
The caveat is one sentence rather than a large closing section.

Browser-checked at 1440 × 1000 and 390 × 844: no horizontal overflow; the desktop
article is about 992 px tall. The site checker still verifies all seven memories
and reference links. Build, appearance tests and local-link checks pass. No push.

## Name-button edition — 2026-09-18 (local follow-up)

At the author's request, the default view now contains seven name-only buttons,
in the original order. Native `details` / `summary` disclosures reveal each
teacher's academic context, unchanged English and Chinese recollections, and
the existing biographical reference link. All entries start closed; the shared
`name` groups the disclosures in browsers supporting exclusive details. No
JavaScript is needed to open or close an entry.

The layout uses two columns on desktop and one below 700px, with 60px / 56px
minimum trigger heights, visible keyboard focus, plus/minus indicators hidden
from assistive technologies and reduced-motion-aware hover color changes.
The extra kicker and verbose introduction are removed. The existing personal-
memory caveat is retained as one quiet line. Stable IDs and all seven memories
remain intact; no source data or third-party biographies are rewritten.

Tests require seven named summary controls, closed initial states, preserved
order/content/references and the unchanged current site navigation. This update
has not been pushed. Browser interaction and screenshots require a working
browser connection and are not implied by static checks.

## Eight teachers and direct links — 2026-09-18

The author added **Gang Li (UCLA)** and the memory that he taught survival
analysis, and explicitly requested arranging the teachers, adding their links
and pushing the update. Added only this supplied recollection in English and
Chinese; no course number, date or anecdote is invented.

[Gang Li's UCLA lab website](https://gang-li.ph.ucla.edu/) confirms his identity
and Biostatistics context. It does not substantiate the personal recollection,
which comes from the author. All eight existing/new reference destinations were
checked on 2026-09-18: faculty/lab pages were retrieved for Ye, Li, Wong, Gang Li,
Dabrowska, Jessica Li and Qian; Fang's existing Zhejiang Online reference was
retrieved via HTTP and contained her name. Her link remains labeled a public
reference, not a current faculty profile.

Order follows the author's educational/research journey: Ping Fang, Gaoxiang Ye,
Haoran Li, Weng Kee Wong, Gang Li, Dorota M. Dabrowska, Jingyi Jessica Li, Hong Qian.
The original seven retain their relative order. This ordering was stated to the
author before implementation.

Each closed-by-default name disclosure now has a separate, always-visible
“Link ↗”. It is a sibling of the disclosure, not an anchor nested in its summary.
The accessible label identifies the teacher, the source and the new-tab behavior.
Links include `noopener noreferrer`. Existing anchors and memories are retained.

Jekyll build, 10-page / 282-local-link checks, three-mode appearance and clipboard
tests pass. Tests require eight controls in the stated order, preserved bilingual
memories, accessible external links outside the disclosures, and the exact new
Gang Li record. Browser access timed out again; current screenshots, keyboard
interaction and responsive visual acceptance remain unverified. Static checks
do not replace these. Publication is authorized; see the refinement release note.
