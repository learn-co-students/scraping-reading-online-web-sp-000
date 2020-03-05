require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
courses = doc.css("#3c239880-48cf-5ce7-84d0-578546d87586 .title-oE5vT4")

courses.each do |course|
  puts course.text.strip
end
