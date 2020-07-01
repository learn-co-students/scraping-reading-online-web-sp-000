require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")
doc = Nokogirl::HTML(html)

doc.css("/om;ome<pbo;e:eft-2Yo002.imageTextBlockGrid3-2XAK6G")