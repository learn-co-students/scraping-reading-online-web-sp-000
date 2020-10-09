require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
doc.css(".headline-26OIBN").text

courses = doc.css("#id-3c239880-48cf-5ce7-84d0-578546d87586 .title-oE5vT4")

courses.each do |course|
  puts course.text.strip
end


#id-3c239880-48cf-5ce7-84d0-578546d87586 > div > div.content-3OTK_R > div > div:nth-child(1) > div.text-4GLMvr > div.title-oE5vT4