require 'nokogiri'
require 'open-uri'

#html = open("https://flatironschool.com/")
html = open("https://markstabler.com/")
doc = Nokogiri::HTML(html)
puts doc
