require 'nokogiri'
require 'open-uri'


html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(open("https://flatironschool.com/"))
p doc.css(".title-3Kf9MY").text