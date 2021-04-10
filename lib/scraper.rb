require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschool.com/"))

courses = doc.css(".text-4GLMvr")

courses.each do |course|
  puts course.text.strip
end

p doc.css(".text-4GLMvr")[0].attributes