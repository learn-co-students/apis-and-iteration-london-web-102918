def welcome
  # puts out a welcome message here!
  puts "Welcome, Star Wars fan!"
end

def get_character_from_user
  puts "Please, enter a Star Wars character: "
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcase
end
