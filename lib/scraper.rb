require 'pry'

require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)

doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

courses = doc.css(".title-oE5vT4")

courses.each do |course|
# binding.pry
  puts course.text.strip
end
