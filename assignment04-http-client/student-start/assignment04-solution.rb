require 'httparty'

class Recipe
  include HTTParty
  default_params key:ENV["FOOD2FORK_KEY"]='268cf736c5248f837baba8eb10e0df33' 
  base_uri 'http://food2fork.com/api'
  format :json
  def self.for keyword
    return get('/search', query: {q: keyword})["recipes"]
  end
end
