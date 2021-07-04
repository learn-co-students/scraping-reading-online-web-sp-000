require 'nokogiri'
require 'open-uri'
require 'pry'

html = open("https://flatironschool.com/")

doc = Nokogiri::HTML(html)

css = doc.css('#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .title-oE5vT4')

test = css.collect {|el| el.text}
binding.pry
