require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://flatironschool.com/"))
doc.css(".inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

#id-46503719-a9c3-5015-beac-801c618e339c > div > h2
#id-46503719-a9c3-5015-beac-801c618e339c > div > h2
#<h2 class="title-3Kf9MY" data-testid="title">Our partners</h2>
