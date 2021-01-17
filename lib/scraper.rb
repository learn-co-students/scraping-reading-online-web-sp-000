require 'nokogiri'
require 'open-uri'



doc = Nokogiri::HTML(open("https://flatironschool.com/"))
doc.css(".headline-26OIBN").text
puts doc.css(".headline-26OIBN")

courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")
courses.each do |course|
  puts course.text.strip
end
