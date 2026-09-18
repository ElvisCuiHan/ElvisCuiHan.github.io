#!/usr/bin/env ruby
require 'nokogiri'
require 'uri'
require 'pathname'
require 'yaml'
require 'json'
require 'digest'
require 'date'

root = File.expand_path(ARGV.fetch(0, '_site'))
routes = ['index.html', 'publications/index.html', 'cv/index.html',
          'writing/index.html', 'mentors/index.html', 'friends/index.html', 'translations/index.html',
          'teaching/index.html', 'sitemap/index.html', '404.html']
errors = []
count = 0
routes.each do |route|
  path = File.join(root, route)
  unless File.file?(path)
    errors << "Missing page: #{route}"
    next
  end
  html = File.read(path)
  doc = Nokogiri::HTML(html)
  errors << "Wrong heading count: #{route}" unless doc.css('h1').size == 1
  errors << "Missing main landmark: #{route}" unless doc.at_css('main#main')
  errors << "Empty title: #{route}" if doc.at_css('title').to_s.empty?
  errors << "Unrendered Liquid: #{route}" if html.match?(/\{%|\{\{/)
  doc.css('a[href], img[src], script[src], link[href]').each do |node|
    target = node['href'] || node['src']
    next if target.nil? || target.empty? || target.start_with?('mailto:', 'tel:', 'data:')
    uri = URI.parse(target)
    next if uri.host && uri.host != 'elviscuihan.github.io'
    next if uri.scheme && !['https', 'http'].include?(uri.scheme)
    urlpath = URI::DEFAULT_PARSER.unescape(uri.path.to_s)
    resolved = if urlpath.empty?
      path
    elsif urlpath.start_with?('/')
      File.join(root, urlpath.delete_prefix('/'))
    else
      File.expand_path(urlpath, File.dirname(path))
    end
    resolved = File.join(resolved, 'index.html') if File.directory?(resolved)
    # GitHub Pages also serves legacy extensionless URLs from matching .html files.
    resolved += '.html' if !File.file?(resolved) && File.file?(resolved + '.html')
    unless File.file?(resolved)
      errors << "Broken local link: #{route} -> #{target}"
      next
    end
    if uri.fragment && resolved.end_with?('.html')
      ids = Nokogiri::HTML(File.read(resolved)).css('[id]').map { |element| element['id'] }
      errors << "Missing anchor: #{route} -> #{target}" unless ids.include?(uri.fragment)
    end
    count += 1
  rescue URI::InvalidURIError
    errors << "Invalid URL: #{route} -> #{target}"
  end
end
homepage = Nokogiri::HTML(File.read(File.join(root, 'index.html')))
papers = YAML.load_file(File.expand_path('../_data/papers.yml', __dir__))
selected = papers.select { |paper| paper['selected'] }.map { |paper| paper['id'] }
featured = YAML.load_file(File.expand_path('../_data/featured.yml', __dir__))
featured_ids = featured.map { |feature| feature['id'] }
errors << 'Selected papers differ from the bibliography' unless selected.sort == featured_ids.sort
errors << 'Selected publications must follow the requested editorial order' unless featured_ids == ['scgtm', 'statistical-compass', 'glucodensity'] && homepage.css('.selected-bibliography>li').map { |n| n['data-paper-id'] } == featured_ids
pubs = Nokogiri::HTML(File.read(File.join(root, 'publications/index.html')))
ids = papers.map { |paper| paper['id'] }
errors << 'Bibliography IDs must be unique and nonempty' unless ids.uniq.size == ids.size && ids.all? { |id| id && !id.empty? }
errors << 'Rendered bibliography differs from the data' unless pubs.css('.paper-list > li').map { |n| n['data-paper-id'] } == ids
{'articles' => 'article', 'preprints' => 'preprint', 'books-thesis' => 'longform'}.each do |section, category|
  expected = papers.count { |paper| paper['category'] == category }
  errors << "Wrong category count: #{section}" unless pubs.css("##{section} .paper-list > li").size == expected
end
errors << 'Old student identity on homepage' if homepage.text.include?('PhD Student')
errors << 'Missing research affiliation' unless ['Center for Interdisciplinary Studies', 'School of Science', 'Qian Lab', 'Postdoctoral'].all? { |text| homepage.text.downcase.include?(text.downcase) }
card = homepage.at_css('.business-card img')
errors << 'Missing business card' unless card && card['src'] == '/assets/images/elvis-business-card.png'
errors << 'Missing downloadable business card' unless homepage.at_css('.business-card a[download]')
wechat = homepage.at_css('#wechat')
errors << 'Missing WeChat public account' unless wechat && wechat.at_css('#wechat-title').text == '让统计再次伟大'
errors << 'Missing WeChat search instructions' unless wechat && wechat.text.include?('Official Accounts')
errors << 'Missing WeChat profile link' unless homepage.at_css('.profile-links a[href="#wechat"]')
errors << 'WeChat card must use only the author-provided essay link' unless wechat && wechat.css('a[href]').map { |n| n['href'] } == ['https://mp.weixin.qq.com/s/hAIXft_2gpk3P9Mvs0X_RQ']
errors << 'WeChat avatar must use the author-provided public profile image' unless wechat&.at_css('.wechat-portrait img')&.[]('src') == '/assets/images/wechat-account-profile.png'
errors << 'WeChat copy button or feedback missing' unless wechat&.at_css('button[data-copy-wechat="让统计再次伟大"][hidden]') && wechat.at_css('.wechat-copy-status[role="status"]')
errors << 'Wrong avatar' unless homepage.at_css('.profile-photo img')['src'] == '/assets/images/elvis-avatar.png'
errors << 'Main navigation capitalization differs' unless homepage.css('.nav-links > a').map(&:text) == ['About','Publications','CV','Writing','Mentors','External Links']
errors << 'Given name emphasis missing' unless homepage.at_css('h1 strong').text == 'Elvis Han'
errors << 'Author-selected personal logo missing' unless homepage.at_css('.nav-brand img.personal-logo')&.[]('src') == '/assets/images/elvis-phoenix-logo.png'
errors << 'Header logo needs a readable name and accessible home link' unless homepage.at_css('.nav-brand')&.[]('aria-label') == 'Elvis Han Cui — About' && homepage.at_css('.brand-wordmark strong')&.text == 'Elvis Han'
errors << 'Favicon must use the selected personal logo' unless homepage.at_css('link[rel="icon"]')&.[]('href') == '/assets/images/elvis-phoenix-logo.png'
errors << 'Decorative landscape missing' unless homepage.at_css('.scholar-backdrop[aria-hidden="true"]') && File.file?(File.join(root, 'assets/images/ink-landscape-v1.jpg'))
essay_url = 'https://mp.weixin.qq.com/s/hAIXft_2gpk3P9Mvs0X_RQ'
writing = Nokogiri::HTML(File.read(File.join(root, 'writing/index.html')))
[writing].each do |page|
  essay = page.at_css('.essay-feature')
  errors << 'Author-provided essay entry missing' unless essay && essay.text.include?('鞅的辉煌与苦难') && essay.at_css("a[href='#{essay_url}']")
  errors << 'Essay must not be presented as pending' if essay && essay.text.match?(/pending|awaiting/i)
end
errors << 'Single three-mode appearance button missing' unless homepage.css('button#appearance-toggle[type="button"]').size == 1 && homepage.css('#appearance-toggle svg[aria-hidden="true"]').size == 3
errors << 'Obsolete appearance dropdown remains' if homepage.at_css('#visual-style') || homepage.at_css('.style-control')
errors << 'Conflicting legacy theme control remains' if homepage.at_css('.theme-toggle') || homepage.at_css('script[src*="academic-theme.js"]')
mentors = YAML.load_file(File.expand_path('../_data/mentors.yml', __dir__))
mentor_page = Nokogiri::HTML(File.read(File.join(root, 'mentors/index.html')))
mentor_ids = %w[ping-fang gaoxiang-ye haoran-li weng-kee-wong dorota-dabrowska jingyi-jessica-li hong-qian]
errors << 'Mentors must preserve the author-supplied order' unless mentors.map { |m| m['id'] } == mentor_ids
errors << 'Rendered mentors differ from the data' unless mentor_page.css('.mentor-entry').map { |n| n['id'] } == mentor_ids
errors << 'Homepage should not duplicate Writing, Translations or Mentors' unless homepage.css('.writing-section, .translations-preview, .mentors-preview, .essay-feature').empty?
errors << 'Independent page navigation must remain available' unless ['/writing/','/mentors/'].all? { |href| homepage.at_css(".nav-links a[href='#{href}']") }
mentors.each do |mentor|
  entry = mentor_page.at_css("##{mentor['id']}")
  errors << "Missing mentor memory: #{mentor['id']}" unless entry && [mentor['recollection'], mentor['memory_zh']].all? { |t| entry.text.include?(t) }
  errors << "Missing biographical reference: #{mentor['id']}" unless entry && entry.at_css("a[href='#{mentor['source_url']}']")
end
errors << 'Personal memories must be distinguished from sourced quotations' unless mentor_page.text.include?('not verbatim quotations')
friends = YAML.load_file(File.expand_path('../_data/friends.yml', __dir__))
friends_section = homepage.at_css('#friends')
errors << 'Missing direct styling acknowledgement' unless friends_section && friends_section['class'] == 'styling-credit' && friends_section.text.include?('for the styling of this website') && friends_section.at_css('a[href="https://yatingz205.github.io/"]')
errors << 'Homepage credit should not remain a Friends promo block' if friends_section && (friends_section.at_css('h2') || friends_section.at_css('a[href="/friends/"]'))
errors << 'Mentors page must keep the compact presentation' unless mentor_page.at_css('.mentors-page--compact') && mentor_page.css('.mentor-index,.mentor-deck,.mentor-theme,.mentor-memory h3').empty?
friends_page = Nokogiri::HTML(File.read(File.join(root, 'friends/index.html')))
errors << 'Deferred friend must not be published' if friends_page.at_css('#friend-tao-wang') || friends_page.at_css('a[href="https://wangtao-phy.github.io/"]')
errors << 'Friends navigation must be active on its page' unless friends_page.at_css('.nav-links a.active[aria-current="page"][href="/friends/"]')
errors << 'External Links page must use its new title' unless friends_page.at_css('h1').text == 'External Links' && friends_page.at_css('title').text.start_with?('External Links')
errors << 'External Links must stay a simple directory' unless friends_page.at_css('.external-links-page') && friends_page.css('.friends-deck,.friend-entry,.friend-gratitude,.friends-colophon').empty?
routes.each do |route|
  page = Nokogiri::HTML(File.read(File.join(root, route)))
  errors << "Missing footer External Links label: #{route}" unless page.at_css('.archive-links a[href="/friends/"]')&.text == 'External Links'
end
translations = JSON.parse(File.read(File.expand_path('../_data/translations.json', __dir__)))['entries']
translation_page = Nokogiri::HTML(File.read(File.join(root, 'translations/index.html')))
translation_ids = translations.map { |book| book['id'] }
errors << 'Translation IDs must be unique' unless translation_ids.uniq.size == translation_ids.size
errors << 'Translation catalogue must render all 11 reviewed entries' unless translation_ids.size == 11 && translation_page.css('.translation-entry').map { |node| node['id'] }.sort == translation_ids.sort
translations.each do |book|
  entry = translation_page.at_css("##{book['id']}")
  errors << "Missing translation attribution: #{book['id']}" unless entry && entry.text.include?(book['originalAuthors']) && entry.at_css("a[href='#{book['originalUrl']}']")
  errors << "Restricted translation has a download: #{book['id']}" if book['status'] != 'hosted-translation' && (book['pdf'] || entry.at_css('.translation-pdf'))
end
pdf_path = '/files/translations/advani-saxe-sompolinsky-2020-zh.pdf'
errors << 'Only the reviewed Advani Chinese PDF may be offered' unless translation_page.css('.translation-pdf').map { |node| node['href'] } == [pdf_path]
errors << 'Reviewed translation PDF differs from source' unless Digest::SHA256.file(File.join(root, pdf_path.delete_prefix('/'))).hexdigest == 'cb9ba63dc0e0bfecdfe0645d98f32be63ea449792edcf5c4bc8112cdab6c471e'
errors << 'Missing translation license or AI disclosure' unless translation_page.at_css('a[href="https://creativecommons.org/licenses/by/4.0/"]') && translation_page.text.include?('Codex-assisted')
errors << 'Translation page should keep Writing highlighted' unless translation_page.at_css('.nav-links a.active[href="/writing/"]')
[writing].each do |page|
  errors << 'Missing translation shelf entry points' unless page.css('.reading-preview-item').map { |node| node['href'] } == ['/translations/#wasserstein-2023', '/translations/#advani-2020']
end
research = YAML.load_file(File.expand_path('../_data/research.yml', __dir__))
theme_ids = research.map { |theme| theme['id'] }
errors << 'Three distinct research themes are required' unless theme_ids.size == 3 && theme_ids.uniq.size == 3
[homepage, pubs].each do |page|
  errors << 'Research themes differ between homepage and publications' unless page.css('.research-theme').map { |n| n['id'] } == theme_ids
end
research.each do |theme|
  theme['works'].each do |work|
    errors << "Theme references unknown paper: #{work['id']}" unless ids.include?(work['id'])
  end
end
errors << 'Selected publications need three illustrated rows and optional context' unless homepage.css('.selected-bibliography>li').size == 3 && homepage.css('.paper-summary summary').size == 3 && homepage.css('.publication-preview img').size == 3 && homepage.css('.featured-work').empty?
homepage.css('.selected-bibliography>li').each do |entry|
  paper = papers.find { |p| p['id'] == entry['data-paper-id'] }
  feature = featured.find { |f| f['id'] == paper['id'] }
  errors << 'Selected publication metadata changed' unless entry.at_css('.paper-title').text == paper['title'] && entry.at_css('.paper-authors').text == paper['authors'] && entry.at_css('.paper-venue').text.include?(paper['venue'])
  errors << 'Selected paper links differ from verified data' unless entry.css('.paper-links>a').map { |n| n['href'] } == paper['links'].map { |link| link['url'] }
  errors << 'Author must be emphasized in each selected work' unless entry.at_css('.paper-authors strong')
  preview = entry.at_css('.publication-preview img')
  errors << 'Missing descriptive first-page image' unless preview && preview['src'] == feature['thumbnail'] && preview['alt'] == feature['thumbnail_alt'] && preview['loading'] == 'lazy'
  errors << 'First-page image must link to the canonical paper record' unless entry.at_css('.publication-thumbnail')&.[]('href') == paper['links'].first['url']
  image_path = File.join(root, feature['thumbnail'].delete_prefix('/'))
  if File.file?(image_path)
    header = File.binread(image_path, 24)
    errors << 'First-page preview must be a correctly sized PNG' unless header.start_with?("\x89PNG\r\n\x1a\n".b) && header[16, 8].unpack('NN') == [feature['thumbnail_width'], feature['thumbnail_height']]
    errors << 'First-page preview is too heavy' unless File.size(image_path) < 1_000_000
  end
  if feature['license_url']
    errors << 'Missing thumbnail license attribution' unless entry.at_css('.publication-preview figcaption a')&.[]('href') == feature['license_url']
  end
end
errors << 'Compass must retain its working-manuscript status' unless homepage.at_css('[data-paper-id="statistical-compass"] .publication-status')&.text == 'Working manuscript, not a publisher-issued book.'
errors << 'Source PDFs must remain outside the generated site' if File.exist?(File.join(root, 'tmp/pdfs/selected-publications')) || Dir.glob(File.join(root, 'assets/images/publications/*.pdf')).any?
errors << 'Missing research question' unless homepage.at_css('#question-title')
errors << 'Writing entry missing' unless homepage.at_css('.research-notes a[href="/writing/"]')
errors << 'FCS must be described as ongoing work, not an invented publication' unless pubs.at_css('#stochastic-dynamics .theme-status').text.include?('ongoing research')
institutions = YAML.load_file(File.expand_path('../_data/institutions.yml', __dir__))
errors << 'Institution buttons must preserve the seven requested destinations' unless institutions.size == 7 && friends_page.css('.institution-logo-grid a').map { |n| n['href'] } == institutions.map { |i| i['url'] }
errors << 'Institutions must move off the homepage' unless homepage.css('.institution-section,.institution-directory,.institution-links,.institution-logo-grid').empty?
errors << 'Institution context must not imply endorsement' unless friends_page.at_css('.institution-note').text.include?('not institutional partnerships or endorsements')
errors << 'Seven institution logos expected; no text placeholder' unless friends_page.css('.institution-mark img').size == 7 && friends_page.css('.institution-text-mark').empty?
errors << 'Huadong official logo missing' unless friends_page.at_css('a[href="https://www.eastchinapharm.com/"] img')&.[]('src') == '/assets/images/institutions/huadong.svg'
errors << 'White Huadong mark requires a dark circular surface' unless friends_page.at_css('a[href="https://www.eastchinapharm.com/"] .institution-mark--navy')
errors << 'Kuntuo must use its own logo and official destination' unless friends_page.at_css('a[href="https://www.kuntuo-cro.com/"] img')&.[]('src') == '/assets/images/institutions/kuntuo.png' && friends_page.css('.institution-logo-grid img[src$="/iqvia.svg"]').empty?
friends_page.css('.institution-logo-grid a').each do |link|
  errors << 'External circle link must safely open in a new tab' unless link['target'] == '_blank' && link['rel'].to_s.split.include?('noopener') && link['aria-label'].include?('opens in a new tab')
end
errors << 'Empty archives must not be promoted' unless homepage.css('a[href="/talks/"],a[href="/year-archive/"]').empty?

# Validate every legacy alias from the current source pages, not only the main routes.
aliases = {}
Dir.glob(File.expand_path('../_pages/*', __dir__)).each do |source|
  match = File.read(source).match(/\A---\s*\n(.*?)\n---/m)
  next unless match
  data = YAML.safe_load(match[1], permitted_classes: [Date, Time])
  next unless data['redirect_from'] && routes.include?(data['permalink'].delete_prefix('/') + 'index.html')
  Array(data['redirect_from']).each { |alias_path| aliases[alias_path] = data['permalink'] }
end
sitemap = File.read(File.join(root, 'sitemap.xml'))
aliases.each do |alias_path, destination|
  output = File.join(root, alias_path.delete_prefix('/'))
  output = File.join(output, 'index.html') unless File.extname(output) == '.html'
  unless File.file?(output)
    errors << "Missing redirect: #{alias_path}"
    next
  end
  doc = Nokogiri::HTML(File.read(output))
  expected = "https://elviscuihan.github.io#{destination}"
  errors << "Wrong redirect target: #{alias_path}" unless doc.at_css('link[rel="canonical"]')&.[]('href') == expected && doc.at_css("a[href='#{destination}']")
  errors << "Redirect must be noindex: #{alias_path}" unless doc.at_css('meta[name="robots"]')&.[]('content') == 'noindex'
  errors << "Alias in sitemap: #{alias_path}" if sitemap.include?("<loc>https://elviscuihan.github.io#{alias_path}</loc>")
end
%w[files/CV.pdf files/paper1.pdf files/paper2.pdf files/paper3.pdf markdown/index.html markdown.html terms/index.html archive-layout-with-content/index.html markdown_generator/publications.tsv].each do |legacy|
  errors << "Retired artifact still published: #{legacy}" if File.exist?(File.join(root, legacy))
end
Dir.glob(File.join(root, '**/*.html')).each do |path|
  doc = Nokogiri::HTML(File.read(path))
  doc.css('script,style').remove
  errors << "Stale identity or template content: #{path}" if doc.text.match?(/PhD Student|2024\s*\(expected\)|Paper Title Number|Portfolio item number|Talk 1 on Relevant Topic/i)
  page_ids = doc.css('[id]').map { |n| n['id'] }
  errors << "Duplicate HTML IDs: #{path}" unless page_ids.uniq.size == page_ids.size
end
abort errors.uniq.join("\n") unless errors.empty?
puts "Site checks passed: #{routes.size} pages, #{count} local links/assets, headings, anchors, bibliography, and affiliation."
puts "Research edition checks passed: three themes, seven institutions, #{aliases.size} legacy aliases, no stale identity or template artifacts."
