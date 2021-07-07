require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)

puts doc.css(".inlineMobileLeft-2Yo002 imageTextBlockGrid2-3jXtmC")
