require 'nokogiri'
require 'open-uri'


html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
# t1 = doc.css(".headline-26OIBN")
# t2 = doc.css(".headline-26OIBN").text.strip
# # h2 = doc.css("#3c239880-48cf-5ce7-84d0-578546d87586 .inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC").text
# doc.css(".inlineMobileLeft-2Yo002 .imageTextBlockGrid3-2XAK6G")
# puts t1
# # puts h2

courses = doc.css("#3c239880-48cf-5ce7-84d0-578546d87586 .inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
 
# courses.each do |course|
#   puts course.text.strip
# end

p doc.css("#3c239880-48cf-5ce7-84d0-578546d87586 .inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")[0].children.text

