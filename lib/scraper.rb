require 'nokogiri'
require 'open-uri'
 
html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)
 
courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")

courses.each do |course|
  puts course
end

#p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0]