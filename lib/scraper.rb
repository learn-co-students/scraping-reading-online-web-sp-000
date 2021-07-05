require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)
list = doc.css('#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .title-oE5vT4')
list.each {|elem| puts elem.text}
