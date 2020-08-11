require 'nokogiri'
require 'open-uri'
 
doc = Nokogiri::HTML(open("https://flatironschool.com/"))
puts doc.css(".headline-26OIBN").text.strip
puts doc.css(".headline-26OIBN")


html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)
# Notice that each class is listed without spaces 
doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

# Assign to a variable to iterate over and output each course
courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")
 
courses.each do |course|
  puts course.text.strip
end

# Operating on XML
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
