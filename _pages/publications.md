---
layout: single
title: publications
permalink: /publications/
excerpt: "Journal and conference articles, preprints, monograph, and dissertation by Elvis Han Cui."
---

{% assign articles = site.data.papers | where: 'category', 'article' %}
{% assign preprints = site.data.papers | where: 'category', 'preprint' %}
{% assign longform = site.data.papers | where: 'category', 'longform' %}
<p class="publication-intro">My work spans statistical methodology, experimental design, biomedical data analysis, and machine learning. Browse the bibliography below or visit <a href="{{ site.author.googlescholar }}">Google Scholar</a>.</p>
<nav class="section-links" aria-label="Publication categories"><a href="#articles">articles · {{ articles.size }}</a><a href="#preprints">preprints · {{ preprints.size }}</a><a href="#books-thesis">monograph &amp; dissertation · {{ longform.size }}</a></nav>

<section id="articles" class="publication-section">
  <h2>journal &amp; conference articles <span class="publication-count">{{ articles.size }}</span></h2>
  {% include paper-list.html papers=articles %}
</section>

<section id="preprints" class="publication-section">
  <h2>preprints &amp; working papers <span class="publication-count">{{ preprints.size }}</span></h2>
  {% include paper-list.html papers=preprints %}
</section>

<section id="books-thesis" class="publication-section">
  <h2>monograph &amp; dissertation <span class="publication-count">{{ longform.size }}</span></h2>
  {% include paper-list.html papers=longform %}
</section>

<p class="quiet-note">Updated September 2026. Titles and author names follow the linked records. Years indicate publication or first posting; later revisions are noted separately. Published articles and their companion preprints share one entry. Preprints and working manuscripts are not presented as peer-reviewed publications.</p>
