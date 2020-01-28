require "pry"
require 'nokogiri'
require 'open-uri'

# open-uri
html = open("https://flatironschool.com/")

# nokogiri
# use the Nokogiri::HTML method to take the string of HTML 
# returned by open-uri's open method and convert it into a NodeSet 
# (aka, a bunch of nested "nodes") that we can easily play around with.
doc = Nokogiri::HTML(html)

courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC").css(".text-4GLMvr").css(".title-oE5vT4") #can also use .strip with .text

courses.each do |course|
  puts course.text.strip
end