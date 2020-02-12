require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")  #open the file
doc = Nokogiri::HTML(html) #save the HTML data in a bunch of nodes
doc.css(".headline-26OIBN").text  #call the css selector(class for this specific html piece) on doc
        #.text allows us to just get the text out of the html 
