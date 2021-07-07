require 'nokogiri'
require 'open-uri'

# html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(open("https://flatironschool.com/"))

puts doc.css(".headline-26OIBN").text 

doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")
