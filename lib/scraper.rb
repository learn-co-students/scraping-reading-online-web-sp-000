require 'nokogiri'
require 'open-uri'

# html = open("https://flatironschool.com/")
require 'nokogiri'
require 'open-uri'

#  html = open("https://flatironschool.com/")
#  Nokogiri::HTML(html)

 doc = Nokogiri::HTML(open("https://flatironschool.com/"))
#   p doc.css(".headline-26OIBN")#.text#.strip
html_array =  doc.css("#f2741bde-8219-55b6-9f40-9f197188ccc0")

#  html_array.each {|html|
#  #Operating on XML
#  puts html.text.strip}
p html_array[0].attributes
