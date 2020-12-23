require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschool.com/")) #=> Grabs html from site
                            #=> Converts to NodeSet
                            #=> Nested Nodes refers to any tree of elemnts in which parent
                            #=> elements branch off ot contain children elements
puts doc.css('inner=3PLBeK inner-3LPBeK')
