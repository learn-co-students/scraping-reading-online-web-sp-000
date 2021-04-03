require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc.css(".headline-26OIBN").text

puts doc.css(".headline-26OIBN")