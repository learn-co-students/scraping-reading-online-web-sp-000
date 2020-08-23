require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
#doc would be a node set. kinda like nodelist i guess. tree of info. similar to nested hashes



 puts doc.css(".headline-26OIBN")
 #if uu use puts, it just show this <h1 class="headline-26OIBN">Change things</h1>
 #thats just the html element
 #but really its actualy so much more than that. a nokogiri object with parent, child info, etc..
 #you u put .class at the tail, you'll see it says Nokogiri::XML::NodeSet

#to get an element using css selectors, do name.css("cssselector")
puts doc.css(".headline-26OIBN").text

#next we want this kind of leement. they all have these two classes
#we have to put it with no spaces in between
courses = doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
#this node set can be iterated through without needing to convert to an array

courses.each do | course |
  puts course.text.strip
end

puts "new line"
#the syntax below is weird. idk why you need [0]. if that's [0] what is [1] [2]???
#i guess that's the next item in the list that also has the 2 classes..

p doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")[0].name
#name of xml element, not html element
p doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")[0].attributes
p doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")[0].children
