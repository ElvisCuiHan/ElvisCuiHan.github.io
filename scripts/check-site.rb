#!/usr/bin/env ruby
require 'nokogiri'
require 'uri'
require 'pathname'

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
errors << 'Selected paper count is not 3' unless homepage.css('.paper-list > li').size == 3
pubs = Nokogiri::HTML(File.read(File.join(root, 'publications/index.html')))
errors << 'Bibliography count is not 5' unless pubs.css('.paper-list > li').size == 5
errors << 'Old student identity on homepage' if homepage.text.include?('PhD Student')
errors << 'Missing formal affiliation' unless homepage.text.include?('Westlake Institute for Advanced Study')
abort errors.uniq.join("\n") unless errors.empty?
puts "Site checks passed: #{routes.size} pages, #{count} local links/assets, headings, anchors, bibliography, and affiliation."
