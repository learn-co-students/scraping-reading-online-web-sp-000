require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
p courses[0].children[1].children[0].text
p courses[0].children[1].children[2].text
p courses[1].children[1].children[0].text
p courses[1].children[1].children[2].text
p courses[2].children[1].children[0].text
p courses[2].children[1].children[2].text
p courses[3].children[1].children[0].text
p courses[3].children[1].children[2].text
