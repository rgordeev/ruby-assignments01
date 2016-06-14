require 'httparty'

class Recipe
  include HTTParty
  default_params key:ENV["FOOD2FORK_KEY"]='19720ef88ee003bc08d43eab18c7b634' 
  base_uri 'http://food2fork.com/api'
  format :json
  def self.for keyword
    return get('/search', query: {q: keyword})["recipes"]
  end
end
