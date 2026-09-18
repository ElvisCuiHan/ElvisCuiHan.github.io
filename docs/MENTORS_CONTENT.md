# Mentor recollections — 2026-09-17

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
