require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")


doc = Nokogiri::HTML(open("http://flatironschool.com/")
doc.css("headline-26OIBN")
