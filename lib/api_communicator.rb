require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
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





  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.


def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  puts films_hash
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
