require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/courses")
doc = Nokogiri::HTML(open(html))
puts "test"
courses =  doc.css(".title-oE5vT4")
courses.each do |course|
  puts course.text
end
