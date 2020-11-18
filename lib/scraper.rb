require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML(URI.open("https://flatironschool.com/"))
puts doc.css(".headline-26OIBN")
puts doc.css(".headline-26OIBN").text.strip

courses = doc.css("#id-3c239880-48cf-5ce7-84d0-578546d87586 .inlineMobileLeft-2Yo002.imageTextBlockGrid2-3jXtmC")
courses.each{|course| puts course.text.strip}
puts courses[0].name
puts courses[0].attributes
