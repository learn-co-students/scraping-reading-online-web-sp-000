require 'nokogiri'
require 'open-uri'
 
doc = Nokogiri::HTML(open("http://flatironschool.com/"))
puts doc.css(".stat-15R3FR").name