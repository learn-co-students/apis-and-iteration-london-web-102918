require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response = []

  response_hash["results"].each do |char_hash|
    if char_hash["name"].downcase.include?(character)
      puts "Found #{char_hash["name"]}!"
      puts "Getting film info!"
      char_hash["films"].each do |link|
         film_info = RestClient.get(link)
         response << JSON.parse(film_info)
       end
    end
  end
  return response
end


def print_movies(films_hash)
  films_hash.each do |item|
  puts  item["title"]
  end
end


def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does
#it do more than one job?
# can you split it up into helper methods?
