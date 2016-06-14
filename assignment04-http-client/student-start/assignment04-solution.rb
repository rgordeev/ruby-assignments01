require 'httparty'

class Recipe
 include HTTParty

 base_uri "http://food2fork.com/api"
 default_params key: ENV["FOOD2FORK_KEY"]="7e10df65cce74babad84c2b8fa3fe25f"
 format :json

 def self.for(keyword)
  get("/search", query: {q: keyword})["recipes"] 
 end
end
