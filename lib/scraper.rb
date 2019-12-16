require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
Nokogiri::HTML(html)
doc = Nokogiri::HTML(html)
doc.css(".headline-26OIBN").text
html = open('http://www.google.com')
