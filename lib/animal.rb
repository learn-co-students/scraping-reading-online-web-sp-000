require 'nokogiri'

class Animal 
  attr_accessor :name, :kingdom, :phylum, :klass, :order, :family, :genius, :species 
  @@all = [] 
  
  # Hooks
  def initialize 
    @@all << self 
  end 
  
  # self.all - Class Method, class Getter 
  def self.all 
    @@all 
  end 
  
  def self.find_by_name(name) 
    self.all.detect{|a| a.name == name}
  end 
  
  # Constructor - 
  def self.new_from_wikipedia(url) 
    Animal.new.tap do |animal| 
      properties = AnimalScraper.wikipedia(url).each do |k, v|
      # k = name
      # v = "value"
        animal.send("#{k}=", v) # Mass Assignment 
    end   
       
    # doc = Nokogiri::HTML(open(url)) 
    # name = doc.search("h1#firstHeading").text 
    
    animal 
  end 
  
end 




