require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html) #=> giving HTML the arg of HTML, requiring it as a module of Nokogiri allows below operations
doc.css(".headline-26OIBN") #=> Nokogiri object
doc.css(".headline-26OIBN").text #=> "Change things"
doc.css(".headline-26OIBN").text.strip #=> "Change things" with whitespaces removed

# chained sections, denoted by .
courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

# iterating over desired web sections // Nokogiri XML elements (*XML == extensive markup language)
courses.each do |course|
  puts course.text.strip
end