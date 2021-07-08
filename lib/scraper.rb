require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
courses.each { |course|
  p "Course: #{course.children[1].children[0].text}"
  p "Description: #{course.children[1].children[2].children[0].children[0].text}"
}
