require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

# take the string of HTML returned by open-uri's open method and convert it into a NodeSet (aka, a bunch of nested "nodes") that we can easily play around with.
doc = Nokogiri::HTML(html)

# following code returns value "Change things." -> the phrase on Flatiron's website
doc.css(".headline-26OIBN").text

#retrieves HTML from specific portion of website
courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")
 
#iterates over data from nokogiri
courses.each do |course|
  puts course.text.strip
end

# output: 
# Software EngineeringLaunch your career as a full-stack web developer ...
# Data ScienceOur full-time data science program that gives students ...
# UX/UI DesignLearn the user experience, client management, technical, ...
 
# returns name of first element in XML
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
# => "div"