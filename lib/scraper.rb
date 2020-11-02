require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
doc.css(".headline-26OIBN").text

courses = doc.css(".gridContainer-EnvccM")

courses.each do |course|
  puts course.text.strip
end

p courses[0].attributes
