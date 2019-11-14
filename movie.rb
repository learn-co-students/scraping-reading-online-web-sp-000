require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def self.index_page
    index_html = open("https://www.imdb.com/list/ls055592025/")
    Nokogiri::HTML(index_html)
  end

  def movie_rankings
    movie_rankings = []
    index_page.css("span.lister-item-index unbold text-primary").each do |movie_ranking| movie_rankings << movie_ranking.text
    end
    movie_rankings
  end
  
  def movie
    Movie.new
  end
end

class Movie

	attr_accessor :imdb_ranking, :title, :year, :rating, :duration, :genre, :release_date, :rating, :brief_summary, :director, :metascore, :user_reviews, :critic_reviews, :oscars, :other_awards, :similar_films, :actors, :characters, :actors_and_characters, :detailed_plot, :tagline, :official_website, :country, :languages, :release_date, :also_known_as, :filming_locations, :budget, :opening_gross, :usa_gross, :worldwide_gross, :studio, :sound_mix, :color, :aspect_ratio, :trivia, :quotes, :crazy_credits, :alternative_versions, :popular_references, :soundtracks, :my_watchlist, :movie_page, :user_selection

	@@all = []
	@@my_watchlist = []
	
	def initialize (imdb_ranking = nil, title = nil, year = nil, rating = nil, duration = nil, genre = nil, director = nil)
		@imdb_ranking = imdb_ranking
		@title = title
		@year = year
		@rating = rating
		@duration = duration
		@genre = genre
		@director = director
	end 
	
	def input_requirement(user_input)
    if user_input >= 1 && user_input <= 100
      true
    else
      false
    end
  end
  
  
  def user_selection
    if @imdb_ranking == nil
      puts "Please enter a movie ranked between 1-100"
      user_input = (gets.strip).to_i
      if input_requirement(user_input) == true
        @imdb_ranking = user_input
      else
        while input_requirement(user_input) != true
          puts "Invalid user_selection. Please enter a imdb_ranking between 1-100."
          user_input = (gets.strip).to_i
        end
        @imdb_ranking = user_input
      end
    end
    @imdb_ranking
  end
  
  def random_selection
    if @imdb_ranking == nil
      @imdb_ranking = rand(1..100)
    end
    @imdb_ranking
  end
  
  def selection
    if user_selection != nil 
      user_selection - 1
    else
      random_selection - 1
    end
  end
  
  def movie_page_url
	  resource = Scraper.index_page.css(".lister-item-header a")[selection]["href"]
	  movie_page_url = "https://www.imdb.com" + resource
  end
  
  def movie_page
    movie_html = open(movie_page_url)
    Nokogiri::HTML(movie_html)
  end
	
	def self.all
		@@all
	end
	
	def save
	  if self.class.all.find {|saved_movie| saved_movie.imdb_ranking == self.imdb_ranking} != nil
	   puts "Already saved. No duplicates allowed."
	   self
	 else
	   puts "Saved successfully."
	   self.class.all << self
	   self
	 end
	end
	
	def self.create(imdb_ranking = nil, title = nil, year = nil, rating = nil, duration = nil, genre = nil, director = nil)
	  new_movie = self.new(imdb_ranking = nil, title = nil, year = nil, rating = nil, duration = nil, genre = nil, director = nil)
	  new_movie.save
	  new_movie
	end
	
	def self.my_watchlist
		@@my_watchlist
	end
	
	def add_to_my_watchlist
	 if self.class.my_watchlist.find {|watchlisted_movie| watchlisted_movie.imdb_ranking == self.imdb_ranking} != nil
	   puts "Already added to my watchlist. No duplicates allowed."
	   self
	 else
	   puts "Added to my watchlist successfully."
	   self.class.my_watchlist << self
	   self
	 end
	end 

	def title
		unedited_title = movie_page.css(".title_wrapper > h1").text
		edited_title = unedited_title.strip.split("(").shift.to_s.chop
		@title = edited_title.strip
	end
	
	def year
	  @year = movie_page.css("#titleYear a").text
	end
	
	def duration
	  @duration = movie_page.css("time")[0].text.strip
	end

	def genre
	  @genre = movie_page.css("time + span.ghost + a")[0].text.strip
	end
	
	def director
	  @director = movie_page.css("h4.inline + a")[0].text.strip
	end
	
	def metascore
	  ##movie_page.css("div.metacriticScore score_favorable titleReviewBarSubItem + span").text
	end
	
	def release_date

	end
	
	def rating
	  @rating = movie_page.css(".titleBar .subtext")[0].text.gsub("\n","").gsub(" ","").split('|')[0].to_s
	end
	
	def brief_summary
	  @brief_summary = movie_page.css("div.summary_text")[0].text.strip
	end
	
	def user_reviews
	  @user_reviews = movie_page.css("span.subText a")[1].text.strip
	end 
	
	def critic_reviews
	  @critic_reviews = movie_page.css("span.subText a")[2].text.strip
	end	
	
	def oscars
	  @oscars = movie_page.css("span.awards-blurb b")[0].text.gsub("\n","").gsub(" ","").gsub("Won", "Won ").gsub("Nominatedfor", "Nominated for ").gsub("Oscars", " Oscars").gsub("Oscar", " Oscar")
	end
	
	def other_awards
	  #movie_page.css("span.awards-blurb + span.awards-blurb")[0].text.strip
	end
	
	def similar_films
	  similar_films_array = []
	  #movie_page.css("div.rec_item rec_selected + a").collect{|film| similar_films_array << film["title"].text.strip}
	  similar_films_array
	end
	
	def actors
	  actors = []
	  cast_array = movie_page.css("table.cast_list td.primary_photo + td a")
	  cast_array.collect{|actor| actors << actor.text.strip}
	  #i = 1 
	  #while i <= cast_array.count
	   # actors << cast_array[i].text.strip
	    #i+=2
	  #end
	  actors
	end
	
	def characters
	  characters = []
	  movie_page.css("table.cast_list .character a").collect{|character| characters << character.text.strip}
	  characters
	end
	
	def actors_and_characters
	  cast_array = []
	  i = 0 
	  while i <= actors.count
	    actor_role = actors[i].to_s + "-" + characters[i].to_s
	    cast_array << actor_role
	    i+=1
	  end
	  cast_array
	end
	
	def detailed_plot
	  movie_page.css(".inline.canwrap").text.strip
	end
	
	def tagline
	   movie_page.css("div.txt-block")[0].text.split("\n")[2].to_s.strip
	end
	
	def official_website
	  resource = movie_page.css("#titleDetails div.txt-block a")[0]["href"]
	  if resource[0..7] != "/offsite"
	    @official_website = nil
	  else
	    @official_website = "www.imdb.com" + resource
	  end
	end
	
	def country
	  #movie_page.css("div.txt-block a")[5].text.strip
	end
	
	def languages
	  movie_page.css("div#titleDetails h4.inline + a")[2].text.strip
	end
	
	def release_date
	end
	
	def also_known_as
	end
	
	def filming_locations
	end
	
	def budget
	  #movie_page.css("div.txt-block .inline")[3].text.strip
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
	  trivia = []
	  trivia_array = movie_page.css("#trivia")[0].text.split("\n")
	  trivia_array[2..trivia_array.count].collect{|trivium| trivia << trivium.to_s.strip}
	  trivia
	end
	
	def quotes
	  quotes = []
	  quotes_array = movie_page.css("#quotes")[0].text.split("\n")
	  quotes_array[2..quotes_array.count].collect{|quote| quotes << quote.to_s.strip}
	  quotes
	end
	
	def crazy_credits
	  crazy_credits = []
	  crazy_credits_array = movie_page.css("#crazyCredits")[0].text.split("\n")
	  crazy_credits_array[2..crazy_credits_array.count].collect{|crazy_credit| crazy_credits << crazy_credit.to_s.strip }
	  crazy_credits
	end
	
	def alternative_versions
	  alternative_versions = []
	  alternative_versions_array = movie_page.css("#alternativeVersions")[0].text.split("\n")
	  alternative_versions_array[2..alternative_versions_array.count].collect{|alternative_version| alternative_versions << alternative_version.to_s.strip}
	  alternative_versions
	end 
	
	def popular_references
	  popular_references = []
	  popular_references_array = movie_page.css("#connections")[0].text.split("\n")
	  popular_references_array[2..popular_references_array.count].collect{|popular_reference| popular_references << popular_reference.to_s.strip}
	  popular_references
	end
	
	def soundtracks
	  soundtracks = []
	  soundtracks_array = movie_page.css("#soundtracks")[0].text.split("\n")
	  soundtracks_array[2..soundtracks_array.count].collect{|soundtrack| soundtracks << soundtrack.to_s.strip}
	  soundtracks
	end
	

end

binding.pry