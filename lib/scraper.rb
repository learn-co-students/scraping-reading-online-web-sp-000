require 'nokogiri'
require 'open-uri'

# html = open("https://flatironschool.com/")

# Nokogiri::HTML(html)

# doc = Nokogiri::HTML(html)

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

courses = doc.css(".gridContainer-EnvccM .title-oE5vT4")

courses.each {|course| puts course.text.strip}

p doc.css(".gridContainer-EnvccM .title-oE5vT4")[0]
p doc.css(".gridContainer-EnvccM .title-oE5vT4")[0].name
p doc.css(".gridContainer-EnvccM .title-oE5vT4")[0].attributes
p doc.css(".gridContainer-EnvccM .title-oE5vT4")[0].children