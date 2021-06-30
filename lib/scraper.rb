require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

# take the string of HTML returned by open-uri's open method 
  # and convert it into a NodeSet (bunch of nested "nodes") 
  # that we can easily play around with.
doc = Nokogiri::HTML(html)

# call .css on doc and give it the argument of our CSS selector:
doc.css(".headline-26OIBN")

# returned what looks like an Array containing one Nokogiri object
# [#<Nokogiri::XML::Element:0x3fdb39ac8380 name="h1" attributes=[#<Nokogiri::XML::Attr:0x3fdb39ac86dc name="class" value="headline-26OIBN">] children=[#<Nokogiri::XML::Text:0x3fdb39ac5d60 "Change things.">]>]

# .text to access text content inside an element
  # scraped by Nokogiri
doc.css(".headline-26OIBN").text
# => "Change things."

# using puts or print on doc.css will cause 
  # the HTML elements to print out
  # p craetes array-like object we saw from before

puts doc.css(".headline-26OIBN")
# => <h1 class="headline-26OIBN">Change things.</h1>

# just add .text (and .strip) and get only the text contained inside the element that we want
# Alternatively, using p will produce the array-like object we saw from before.

# Iterating over elements
courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")
 
courses.each do |course|
  puts course.text.strip #strip clean up extra white space 
    # and return text inside the element
end

# => Software EngineeringLaunch your career as a full-stack web developer ...
# => Data ScienceOur full-time data science program that gives students ...
# => UX/UI DesignLearn the user experience, client management, technical, ...

#XML element 
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
# => "div"

#.attributes will return ids, names, and classes
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].attributes
#=> {"class"=>#<Nokogiri::XML::Attr:0x3fd0e50e1b04 name="class" value="inlineMobileLeft-2Yo002 imageTextBlockGrid3-2XAK6G">}