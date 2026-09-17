#!/usr/bin/env ruby
require 'nokogiri'
require 'uri'
require 'pathname'
require 'yaml'
require 'json'
require 'digest'

root = File.expand_path(ARGV.fetch(0, '_site'))
routes = ['index.html', 'publications/index.html', 'cv/index.html',
          'writing/index.html', 'mentors/index.html', 'friends/index.html', 'translations/index.html',
          'teaching/index.html', 'talks/index.html', 'year-archive/index.html', '404.html']
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
errors << 'Selected papers differ from the bibliography' unless homepage.css('.paper-list > li').map { |n| n['data-paper-id'] } == selected
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
errors << 'Unverified external WeChat link' if wechat && wechat.at_css('a[href]')
errors << 'Wrong avatar' unless homepage.at_css('.profile-photo img')['src'] == '/assets/images/elvis-avatar.png'
errors << 'Main navigation capitalization differs' unless homepage.css('.nav-links > a').map(&:text) == ['About','Publications','CV','Writing','Mentors','Friends']
errors << 'Given name emphasis missing' unless homepage.at_css('h1 strong').text == 'Elvis Han' && homepage.at_css('.nav-name strong').text == 'Elvis Han'
errors << 'Decorative landscape missing' unless homepage.at_css('.scholar-backdrop[aria-hidden="true"]') && File.file?(File.join(root, 'assets/images/ink-landscape-v1.jpg'))
essay_url = 'https://mp.weixin.qq.com/s/hAIXft_2gpk3P9Mvs0X_RQ'
writing = Nokogiri::HTML(File.read(File.join(root, 'writing/index.html')))
[homepage, writing].each do |page|
  essay = page.at_css('.essay-feature')
  errors << 'Author-provided essay entry missing' unless essay && essay.text.include?('鞅的辉煌与苦难') && essay.at_css("a[href='#{essay_url}']")
  errors << 'Essay must not be presented as pending' if essay && essay.text.match?(/pending|awaiting/i)
end
errors << 'Three appearance choices missing' unless homepage.css('#visual-style option').map { |n| n['value'] } == ['ink','day','night']
errors << 'Conflicting legacy theme control remains' if homepage.at_css('.theme-toggle') || homepage.at_css('script[src*="academic-theme.js"]')
mentors = YAML.load_file(File.expand_path('../_data/mentors.yml', __dir__))
mentor_page = Nokogiri::HTML(File.read(File.join(root, 'mentors/index.html')))
mentor_ids = %w[ping-fang gaoxiang-ye haoran-li weng-kee-wong dorota-dabrowska jingyi-jessica-li hong-qian]
errors << 'Mentors must preserve the author-supplied order' unless mentors.map { |m| m['id'] } == mentor_ids
errors << 'Rendered mentors differ from the data' unless mentor_page.css('.mentor-entry').map { |n| n['id'] } == mentor_ids
errors << 'Homepage mentor links differ from the data' unless homepage.css('.mentors-preview-list a').map { |n| n['href'] } == mentor_ids.map { |id| "/mentors/##{id}" }
mentors.each do |mentor|
  entry = mentor_page.at_css("##{mentor['id']}")
  errors << "Missing mentor memory: #{mentor['id']}" unless entry && [mentor['recollection'], mentor['memory_zh']].all? { |t| entry.text.include?(t) }
  errors << "Missing biographical reference: #{mentor['id']}" unless entry && entry.at_css("a[href='#{mentor['source_url']}']")
end
errors << 'Personal memories must be distinguished from sourced quotations' unless mentor_page.text.include?('not verbatim quotations')
friends = YAML.load_file(File.expand_path('../_data/friends.yml', __dir__))
friends_section = homepage.at_css('#friends')
errors << 'Missing Friends section' unless friends_section && friends_section.at_css('h2').text == 'Friends'
errors << 'Homepage must link to the independent Friends page' unless friends_section && friends_section.at_css('a[href="/friends/"]')
friends_page = Nokogiri::HTML(File.read(File.join(root, 'friends/index.html')))
errors << 'Deferred friend must not be published' if friends_page.at_css('#friend-tao-wang') || friends_page.at_css('a[href="https://wangtao-phy.github.io/"]')
errors << 'Friends navigation must be active on its page' unless friends_page.at_css('.nav-links a.active[aria-current="page"][href="/friends/"]')
friends.each do |friend|
  entry = friends_page.at_css("#friend-#{friend['id']}")
  errors << "Missing friend acknowledgement: #{friend['id']}" unless entry && entry.text.include?(friend['name']) && entry.text.include?(friend['thanks']) && entry.at_css("a[href='#{friend['url']}']")
end
routes.each do |route|
  page = Nokogiri::HTML(File.read(File.join(root, route)))
  errors << "Missing footer Friends link: #{route}" unless page.at_css('.archive-links a[href="/friends/"]')
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
[homepage, writing].each do |page|
  errors << 'Missing translation shelf entry points' unless page.css('.reading-preview-item').map { |node| node['href'] } == ['/translations/#wasserstein-2023', '/translations/#advani-2020']
end
abort errors.uniq.join("\n") unless errors.empty?
puts "Site checks passed: #{routes.size} pages, #{count} local links/assets, headings, anchors, bibliography, and affiliation."
