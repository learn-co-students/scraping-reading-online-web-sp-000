require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschool.com/our-courses/"))
courses = doc.css(".title-3CyKCM")
courses.each do |course|
  puts course.text.strip
end
