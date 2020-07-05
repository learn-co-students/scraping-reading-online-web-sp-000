require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschoo.com/"))

doc.css(".headline-260IBN").text
