require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)

courses = doc.css("#id-f88b49f0-3792-5b36-adbf-65b9eab688a5 .inlineMobileLeft-2Yo002 imageTextBlockGrid2-3jXtmC")
courses.each do |course|
  puts course.text.strip
end
