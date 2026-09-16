---
layout: single
title: publications
permalink: /publications/
excerpt: "Selected publications and preprints by Elvis Han Cui."
---

<p class="publication-intro">For a broader list, see my <a href="{{ site.author.googlescholar }}">Google Scholar profile</a> and <a href="{{ '/cv/' | relative_url }}">CV</a>.</p>
<nav class="section-links" aria-label="Publication categories"><a href="#articles">journal &amp; conference articles</a><a href="#preprints">preprints</a></nav>

<section id="articles" class="publication-section">
  <h2>journal &amp; conference articles</h2>
  {% assign articles = site.data.papers | where: 'category', 'article' %}
  {% include paper-list.html papers=articles %}
</section>

<section id="preprints" class="publication-section">
  <h2>preprints</h2>
  {% assign preprints = site.data.papers | where: 'category', 'preprint' %}
  {% include paper-list.html papers=preprints %}
</section>

<p class="quiet-note">Preprints are listed as preprints; publication details refer to the linked sources. Earlier project descriptions remain available in the <a href="{{ '/cv/' | relative_url }}">CV</a>.</p>
