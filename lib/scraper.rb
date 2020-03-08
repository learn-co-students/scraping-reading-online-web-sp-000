require 'nokogiri'
require 'open-uri'

html = open("https://norse-mythology.org/tales/norse-creation-myth/")
doc = Nokogiri::HTML(html)
titles = doc.css('strong').text
puts doc.css('.entry-title').text
