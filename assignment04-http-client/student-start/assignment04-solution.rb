require 'httparty'

class Recipe
include HTTParty
 
 base_uri "http://food2fork.com/api"
 default_params key: ENV["FOOD2FORK_KEY"]="2d28b6f52efa3571a545b79b4ef44f6d"
 format :json

 def self.for(keyword)
  get("/search", query: {q: keyword})["recipes"] 
 end
end
