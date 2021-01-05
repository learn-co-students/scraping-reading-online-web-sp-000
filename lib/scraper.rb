require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)

courses = doc.css("#id-3c239880-48cf-5ce7-84d0-578546d87586 .title-oE5vT4")
puts "Current amount of elements in #courses: #{courses.size}

"
 courses.each do |item|
   puts "* #{item.text.strip}"
 end
