require 'httparty'

class Recipe
	 include HTTParty
  format :json
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]

  def self.for(keyword)
    get("/search", query: {q: keyword})["recipes"] 
  end
end
