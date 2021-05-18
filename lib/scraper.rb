require 'nokogiri'
require 'open-uri'

# html = open("https://flatironschool.com/")

# Nokogiri::HTML(html)

# doc = Nokogiri::HTML(html)

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

courses = doc.css(".gridContainer-EnvccM .title-oE5vT4")

courses.each do |course|
    puts course.text.strip
end

