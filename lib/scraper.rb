require 'nokogiri'
require 'open-uri'
 require 'pry'
html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)
 
course = doc.css(".headline-26OIBN")
course.each do |course|
    puts course.text.strip
end

# binding.pry
