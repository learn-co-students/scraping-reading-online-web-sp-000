require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(open("https://flatironschool.com/"))

doc.css(".headline-26OIBN").text.strip

courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name

courses.each do |course|
  puts course.text.strip
end
