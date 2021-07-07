require 'nokogiri'
require 'open-uri'

#We can use the following line to grab the HTML that makes up the Flatiron School's landing page at flatironschool.com:
html = open("https://flatironschool.com/")

#method to take the string of HTML returned by open-uri's open method and convert it into a NodeSet
Nokogiri::HTML(html)

#Let's save the HTML document in a variable, doc that we can then operate on:
doc = Nokogiri::HTML(html)

#puts doc
#What we're looking at here is all of the HTML that makes up the web page found at www.flatironschool.com. The massive lines above are actually a snapshot of that HTML converted into a structure of nested nodes by Nokogiri.

#Let's call .css on doc and give it the argument of our CSS selector:
doc = Nokogiri::HTML(open("https://flatironschool.com/"))
doc.css(".headline-26OIBN")

# In actuality, this 'Array' is also a special Nokogiri object, but works very much like an Array. If you look closely at the object contained within it, you'll see that it has the 'Change things' text towards the end! To get it out, we can call .text:
doc.css(".headline-26OIBN").text

#Using .text allows us to access text content inside an element scraped by Nokogiri. Run in IRB, we'd see something like this returned:
=> "Change things."

#using puts or print on doc.css will cause the HTML elements to print out.
puts doc.css(".headline-26OIBN")
#print out:
<h1 class="headline-26OIBN">Change things.</h1>

#.text and .strip: and get only the text contained inside the element that we want. Alternatively, using p will produce the array-like object we saw from before.

#We did it! We used Nokogiri to get the HTML of a web page. We used the element inspector in the browser to ID the CSS selector of the data we wanted to scrape. We used the .css Nokogiri method, along with that CSS selector, to grab the element that contains our desired data. Finally, we used the .text method to retrieve the desired text.


#Iterating over elements:
require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html)

doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

#Using .each and puts out each course:
courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

courses.each do |course|
  puts course.text.strip
end

#outputs: Software EngineeringLaunch your career as a full-stack web developer ...
#Data ScienceOur full-time data science program that gives students ...
#UX/UI DesignLearn the user experience, client management, technical, ...

#operating on XML:
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0]
#outputs an XML element - XML stands for Extensible Markup Language. Just like HTML, it is a set of rules for encoding and displaying data on the web.

#When we use Nokogiri methods, we get XML elements in return. Looking at the output object, we can see it has a name, "h2". We can get this info directly by adding these to the end of our doc.css call:
p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
# => "div"
