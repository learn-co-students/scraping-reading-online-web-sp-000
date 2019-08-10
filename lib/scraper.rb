require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(open("http://flatironschool.com/"))
puts doc.css(".site-header__hero__headline").text.strip 

