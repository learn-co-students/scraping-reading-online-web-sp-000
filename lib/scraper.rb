require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
p doc.css(".gridContainer-EnvccM")[0].attributes