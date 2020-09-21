#Aside: In general adding .strip to the end will allow us to clean up the extra whitespace and simply return the text contained inside the element.


require 'nokogiri'
require 'open-uri'



html = open("https://flatironschool.com/")


Nokogiri::HTML(html)

#doc = Nokogiri::HTML(open("https://flatironschool.com/"))
doc = Nokogiri::HTML(html)

p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
# => "div"
 
courses.each do |course|
  puts course.text.strip
end

#doc.css(".headline-26OIBN").text
#doc = Nokogiri::HTML(html)

#puts doc.css(".headline-26OIBN")

#<h1 class="headline-26OIBN">Change things.</h1>