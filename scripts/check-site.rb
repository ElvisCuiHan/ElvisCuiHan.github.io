#!/usr/bin/env ruby
require 'nokogiri'
require 'uri'
require 'pathname'
require 'yaml'

root = File.expand_path(ARGV.fetch(0, '_site'))
routes = ['index.html', 'publications/index.html', 'cv/index.html',
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
errors << 'Missing WeChat search instructions' unless wechat && wechat.text.include?('Official Accounts') && wechat.text.include?('搜一搜')
errors << 'Missing WeChat profile link' unless homepage.at_css('.profile-links a[href="#wechat"]')
errors << 'Unverified external WeChat link' if wechat && wechat.at_css('a[href]')
errors << 'Wrong avatar' unless homepage.at_css('.profile-photo img')['src'] == '/assets/images/elvis-avatar.png'
abort errors.uniq.join("\n") unless errors.empty?
puts "Site checks passed: #{routes.size} pages, #{count} local links/assets, headings, anchors, bibliography, and affiliation."
