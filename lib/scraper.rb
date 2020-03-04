require 'nokogiri'
require 'open-uri'

# doc = Nokogiri::HTML(open("https://flatironschool.com/"))

# p doc.css(".headline-26OIBN").text

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

p courses =  doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")

courses.each do |course|
  puts course.text.strip
end