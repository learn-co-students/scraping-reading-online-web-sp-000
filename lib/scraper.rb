require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

#Nokogiri::HTML(html)

doc = Nokogiri::HTML(html)
#courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")[0].attributes
courses.each do |course|
    puts course.text.strip
  end

  