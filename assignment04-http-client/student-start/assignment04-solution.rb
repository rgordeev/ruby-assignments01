require 'httparty'

class Recipe
  include HTTParty
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]='462616074ec78986f2798c2f6ba88711'
  format :json
  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
