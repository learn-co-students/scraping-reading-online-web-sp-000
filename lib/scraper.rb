require_relative '../config/environment'
# require 'nokogiri'
# require 'open-uri'
# require 'pry'

html = open("https://flatironschool.com/our-courses/")

doc = Nokogiri::HTML(html)

# puts doc

courses = doc.css(".title-oE5vT4")

courses.each {|course| puts course.text.strip}

p courses[0]


binding.pry
