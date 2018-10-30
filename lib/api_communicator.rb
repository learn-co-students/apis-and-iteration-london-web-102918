require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  # make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  films_array = []

  response_hash['results'].each do |person|
    if person["name"].downcase.include?(character.downcase)
      puts "Found character #{person["name"]}..."
      puts "Returning list of movies for #{person["name"]}..."
      puts "......MOVIES......"
      films_array << person['films']
    end
  end
  films_array
end

def print_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  movie_names = []
  films_array.flatten.each do |film_url|
    film_string = RestClient.get(film_url)
    parsed_film_string = JSON.parse(film_string)
    movie_names << parsed_film_string["title"]
  end
  movie_names
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  if films_array.length == 0
    puts "Sorry, this is not a Star Wars character."
  else
    puts print_movies(films_array)
    puts ".................."
  end
end




## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
