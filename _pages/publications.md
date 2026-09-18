---
layout: single
title: Publications
permalink: /publications/
excerpt: "Journal and conference articles, preprints, monograph, and dissertation by Elvis Han Cui."
redirect_from:
  - /publications.html
  - /publications/2010-10-01-paper-title-number-2/
---

{% assign articles = site.data.papers | where: 'category', 'article' %}
{% assign preprints = site.data.papers | where: 'category', 'preprint' %}
{% assign longform = site.data.papers | where: 'category', 'longform' %}
<p class="publication-deck">Different scales. A shared pursuit of understanding.</p>
<p class="publication-intro">My research connects stochastic dynamics, statistical methodology and computational biology. These three threads offer a guide to the work; the complete bibliography below preserves each paper’s original title, authors and publication status.</p>
<nav class="research-index" aria-label="Research themes">{% for theme in site.data.research %}<a href="#{{ theme.id }}"><span>{{ theme.number }}</span> {{ theme.short }}</a>{% endfor %}<a href="#bibliography">Full bibliography ↓</a></nav>
{% include research-themes.html detail=true %}
<div class="bibliography-heading" id="bibliography"><p class="section-kicker">THE COMPLETE RECORD</p><h2>Publications &amp; Preprints</h2><p>Browse by publication type, with newest records first within each section. Also on <a href="{{ site.author.googlescholar }}">Google Scholar ↗</a>.</p></div>
<nav class="section-links" aria-label="Publication categories"><a href="#articles">Articles · {{ articles.size }}</a><a href="#preprints">Preprints · {{ preprints.size }}</a><a href="#books-thesis">Monograph &amp; Dissertation · {{ longform.size }}</a></nav>

<section id="articles" class="publication-section">
  <h2>Journal &amp; Conference Articles <span class="publication-count">{{ articles.size }}</span></h2>
  {% include paper-list.html papers=articles %}
</section>

<section id="preprints" class="publication-section">
  <h2>Preprints &amp; Working Papers <span class="publication-count">{{ preprints.size }}</span></h2>
  {% include paper-list.html papers=preprints %}
</section>

<section id="books-thesis" class="publication-section">
  <h2>Monograph &amp; Dissertation <span class="publication-count">{{ longform.size }}</span></h2>
  {% include paper-list.html papers=longform %}
</section>

<p class="quiet-note">Updated September 2026. Titles and author names follow the linked records. Years indicate publication or first posting; later revisions are noted separately. Published articles and their companion preprints share one entry. Preprints and working manuscripts are not presented as peer-reviewed publications.</p>
