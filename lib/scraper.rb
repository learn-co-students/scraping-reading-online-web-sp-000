require 'nokogiri'
require 'open-uri'

html = open("http://flatironschool.com/")
doc = Nokogiri::HTML(html)
courses = doc.css("id-3c239880-48cf-5ce7-84d0-578546d87586 inlineMobileLeft-2Yo002 imageTextBlockGrid2-3jXtmC")

courses.each do |course|
  puts course.text.strip
end
