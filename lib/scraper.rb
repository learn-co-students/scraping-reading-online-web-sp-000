require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

#doc.css(".headline-26OIBN").text


# courses = doc.css(".title-oE5vT4")

# courses.each do |course|
#     puts course.text.strip
# end

p doc.css(".title-oE5vT4")[0].children




