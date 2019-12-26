require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
html = Nokogiri::HTML(html)

p html.css('.buttonBlue-3yHkWz.heading-3RIoNe')[0].text
puts html.css('.buttonBlue-3yHkWz.heading-3RIoNe')[0].attributes
puts html.css('.buttonBlue-3yHkWz.heading-3RIoNe')[0].children
# puts html.css('.buttonBlue-3yHkWz.heading-3RIoNe')[0].each {|e| puts e}