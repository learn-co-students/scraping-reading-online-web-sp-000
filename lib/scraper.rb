require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

doc.css(".site-header_hero_headline")

