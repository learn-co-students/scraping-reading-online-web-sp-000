require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)

courses = doc.css("div.title-oE5vT4")[0..3].children

i = 1
courses.each do |course|
    puts "#{i}) #{course.text}"
    i += 1
end