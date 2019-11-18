require 'nokogiri'
require 'open-uri'


html = open("https://flatironschool.com/free-courses/coding-bootcamp-prep")
doc = Nokogiri::HTML(html)
doc.css(".headline-260IBN")
