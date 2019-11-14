require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def index_page
    index_html = open("https://www.imdb.com/list/ls055592025/")
    Nokogiri::HTML(index_html)
  end

  def movie_rankings
    movie_rankings = []
    index_page.css("span.lister-item-index unbold text-primary").each do |movie_ranking| movie_rankings << movie_ranking.text
    end
    movie_rankings
  end
  
  def input_requirement(user_input)
    if user_input >= 1 && user_input <= 100
      true
    else
      false
    end
  end
  
  def selection
    puts "Please enter a movie ranked between 1-100"
    user_input = (gets.strip).to_i
    if input_requirement(user_input) == true
      user_input
    else
      while input_requirement(user_input) != true
        puts "Invalid selection. Please enter a ranking between 1-100."
        user_input = (gets.strip).to_i
      end
      user_input
    end
  end
  
  def movie_page_url
	  resource = index_page.css(".lister-item-header a")[selection]["href"]
	  movie_page_url = "https://www.imdb.com" + resource
  end
  
  def movie_page
    movie_html = open(movie_page_url)
    Nokogiri::HTML(movie_html)
  end

end

class Movie

	attr_accessor :ranking, :title, :year, :rating, :duration, :genre, :release_date, :rating, :brief_summary, :director, :metascore, :user_reviews, :critic_reviews, :oscars, :other_awards, :similar_films, :actors, :characters, :actors_and_characters, :detailed_plot, :tagline, :official_website, :country, :languages, :release_date, :also_known_as, :filming_locations, :budget, :opening_gross, :usa_gross, :worldwide_gross, :studio, :sound_mix, :color, :aspect_ratio, :trivia, :quotes, :crazy_credits, :alternative_versions, :popular_references, :soundtracks, :my_queue
	
	@@all = []
	@@my_queue = []
	
	def initialize (ranking = nil, title = nil, year = nil, rating = nil, duration = nil, genre = nil, director = nil, metascore = nil)
		@ranking = ranking
		@title = title
		@year = year
		@rating = rating
		@duration = duration
		@genre = genre
		@director = director
		@metascore = metascore		

	end 
	
	def self.all
		@@all
	end
	
	def add_to_my_queue
		self.my_queue << self
	end 
	
	def self.my_queue
		@@my_queue
	end
	
	def scraper
		Scraper.new
	end
	
	 def movie_list
		scraper.index_page
	 end
	
	def movie_doc
		scraper.movie_page
	end
	
	
	def ranking
		scraper.selection
	end
	
	def title
		unedited_title = movie_doc.css(".title_wrapper > h1").text
		edited_title = unedited_title.strip.split('(').shift.to_s.strip
	end
	
	def year
	  movie_doc.css("#titleYear a").text
	end
	
	def duration
	  movie_doc.css("time")[0].text.strip
	end

	def genre
	  ##movie_doc.css(".title_wrapper span.ghost + a").text.strip
	end
	
	def director
	  movie_doc.css("h4.inline + a")[0].text.strip
	end
	
	def metascore
	  ##movie_doc.css("div.metacriticScore score_favorable titleReviewBarSubItem + span").text
	end
	
	def release_date
	  
	end
	
	def rating
	  #movie_doc.css("h1 div.subtext")[0].text.strip
	end
	
	def brief_summary
	  movie_doc.css("div.summary_text")[0].text.strip
	end
	
	def user_reviews
	  movie_doc.css("span.subText a")[1].text.strip
	end 
	
	def critic_reviews
	  movie_doc.css("span.subText a")[2].text.strip
	end	
	
	def oscars
	  #movie_doc.css("span.awards-blurb b")[0].text.gsub('\n','').strip
	end
	
	def other_awards
	  #movie_doc.css("span.awards-blurb + span.awards-blurb")[0].text.strip
	end
	
	def similar_films
	  similar_films_array = []
	  #movie_doc.css("div.rec_item rec_selected + a").collect{|film| similar_films_array << film["title"].text.strip}
	  similar_films_array
	end
	
	def actors
	end
	
	def characters
	end
	
	def actors_and_characters
	end
	
	def detailed_plot
	  #movie_doc.css("div.inline canwrap span").text.strip
	end
	
	def tagline
	   movie_doc.css("div.txt-block")[0].text.strip
	end
	
	def official_website
	  movie_doc.css("#titleDetails div.txt-block a")[0]["href"]
	end
	
	def country
	  #movie_doc.css("div.txt-block a")[5].text.strip
	end
	
	def languages
	  movie_doc.css("div#titleDetails h4.inline + a")[2].text.strip
	end
	
	def release_date
	end
	
	def also_known_as
	end
	
	def filming_locations
	end
	
	def budget
	end
	
	def opening_gross
	end
	
	def usa_gross
	end
	
	def worldwide_gross
	end
	
	def studio
	end
	
	def sound_mix
	end
	
	def color
	end
	
	def aspect_ratio
	end
	
	def trivia
	end
	
	def quotes
	end
	
	def crazy_credits
	end
	
	def alternative_versions
	end 
	
	def popular_references 
	end
	
	def soundtracks
	end
	

end

binding.pry