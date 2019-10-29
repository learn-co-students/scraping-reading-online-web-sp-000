require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
p doc.css(".headline-26OIBN")

courses = doc.css(".title-oE5vT4")

courses.each {|course| puts course.text.strip}
