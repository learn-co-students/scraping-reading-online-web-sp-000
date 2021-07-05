require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/our-courses/")

doc = Nokogiri::HTML(html)



doc.css("#cd016a4c-d090-5b88-9be3-63e6d9187edf .inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC").text.strip
