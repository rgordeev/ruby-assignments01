
require 'httparty'

class Recipe
  include HTTParty 
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]='b42e60a976a819b63736c414644fc2ac' 
  format :json
  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
