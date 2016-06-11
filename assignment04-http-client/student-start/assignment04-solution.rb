require 'httparty'

class Recipe
include HTTParty
base_uri "http://food2fork.com/api"
#default_params key: ENV["FOOD2FORK_KEY"]="cea0e8809a79bbc38c2e1f521d117388"
default_params key: ENV["FOOD2FORK_KEY"]
format :json
def self.for (keyword)
get("/search", query: {q: keyword})["recipes"]
#,count: 1 in request for fixed number
end
end
