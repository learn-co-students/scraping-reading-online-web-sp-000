require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
p doc.css(".headline-26OIBN")[0].attributes 
