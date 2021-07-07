require "pry"

def welcome
  puts "Hello! Welcome to Star Wars Character Wooki."
end


def get_character_from_user
  puts "Please enter a character"
  gets.chomp.downcase
end

