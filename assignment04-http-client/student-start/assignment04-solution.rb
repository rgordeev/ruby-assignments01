require 'httparty'

class Recipe
  include HTTParty 
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]='28f832005cd709eab10f1d3d9d9c53b8' 
  format :json
  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
