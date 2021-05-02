require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokgiri::HTML(html)
doc.css(".headline-260IBN").text