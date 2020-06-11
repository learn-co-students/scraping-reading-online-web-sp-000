require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

#need a temporary variable = doc
#Nokogiri::HTML(html) - take the string of HTML returned by open uri's #open method
#and convert it into a NodeSet (aka, a bunch of nested "nodes") that we can easily play around with
doc = Nokogiri::HTML(open("https://flatironschool.com/"))
# simply just doing "doc.css("insert #{id} followed by the .{class}")", you get an array

courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0]
# assign the output of the array into a variable so you can iterate that
courses.each do |course|
  puts course.text.strip
end
