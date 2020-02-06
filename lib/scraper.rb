require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogiri::HTML(html) 
buttons = doc.css(".buttonBlue-3yHkWz")

p buttons[0].attributes 