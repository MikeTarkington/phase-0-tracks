# Instructions
#
# Using plain old English in a text file or other scratch pad, pseudocode a class for a word-guessing game that meets the following specifications. Assume your driver code will handle input and output as far as the user is concerned. In other words, write a class designed for a computer program to use, not one designed for a human to use directly, then use driver code to bridge the gap between human and Ruby object.
#
# - One user can enter a word (or phrase, if you would like your game to support that), and another user attempts to guess the word.
#
# - Guesses are limited, and the number of guesses available is related to the length of the word.
#
# - Repeated guesses do not count against the user.
#
# - The guessing player receives continual feedback on the current state of the word. So if the secret word is "unicorn", the user will start out seeing something like "_ _ _ _ _ _ _", which would become "_ _ _ c _ _ _" after the user enters a guess of "c".
#
# - The user should get a congratulatory message if they win, and a taunting message if they lose.


# Pseudocode Notes

# -create class GuessGame
# -will need to use instance variables that can be modified outside the class or at least have methods that can take arguments entered by users
# -method outputs will need to be managed such that they can be used for responses to the user
# -create an opportunity for one user to enter a word to be stored as an instance variable
# -another for the second user to enter their guess
# -use a loop to make a condition that the user cannot guess more times than the number of characters in the word their trying to discover
# -control flow within the loop will determine the feedback they get based on their guesses
# -because the guesser user will be guessing characters present in the word, it may be best to use .chars on the original word so that checks can be conducted with .each or perhaps .map for parts where we change an "_" to the revealed character
# -consider adding function to guess the entire word and end the game if they are correct
# -based once the loop ends a congratulatory message or taunt should be displayed depending on whether or not they've succeeded

# class ExampleClass

#   attr_accessor :new_array

#   def initialize(string)
#     @array = string.chars
#     @new_array = "x" * @array.length
#   end

#   def char_repalacer(letter)
#     @array.each do |char|
#       if char == letter
#         @new_array[@array.index(letter)] = letter
#       end
#     end
#     @new_array
#   end
# end

# example_instance = ExampleClass.new("abcb")
# p example_instance.char_repalacer("a")
# p example_instance.char_repalacer("b")

class GuessGame

  attr_accessor :target_word, :guess_progress

  def initialize(target_word)
    @target_word = target_word.chars
    @guess_progress = "_" * @target_word.length
    @guess_progress = @guess_progress.chars
  end

  def guess_checker(user_guess)
    idx = 0
    if user_guess.chars == @target_word
      "Holy macaroni! You guessed the magic word! You're a winner!"
    else
      @target_word.each do |char_guess|
        if char_guess == user_guess
          @guess_progress[idx] = user_guess
        end
        idx += 1
      end
      @guess_progress.join(" ")
    end
  end

end

# -- DRIVER CODE TESTS --

# test_init = GuessGame.new("testing")
# #argument of a character or full word will be passed to guess checker
# p test_init.guess_checker("s")
# p test_init.guess_checker("t")
# p test_init.guess_checker("testing")


# -- USER INTERFACE --

puts "Welcome to the word guessing game!"
puts " "
puts "Please begin by having player 1 enter the word that player 2 will attempt to guess (Hey player 2! No peeking!):"
target_word = gets.chomp!
game_instance = GuessGame.new(target_word)

puts "Now player 2 enters their guesses. Player 2 can try to guess the entire word or guess one character at a time.  They will only get as many guesses as there are characters in the word.  Please only enter lower case alphabet characters."
puts " "
puts "It's your time to shine player 2... enter your guesses:"
idx = 0
remaining_guesses = target_word.length - 1
while target_word.length > idx
  puts "what is your guess?"
  current_guess = gets.chomp
  if current_guess == target_word
    puts "#{game_instance.guess_checker(current_guess)}"
    break
  elsif current_guess.length > 1 && current_guess != target_word
    puts "Your guess is not the correct word. I'm losing faith in your abilities."
    puts "You have #{remaining_guesses} remaining guesses."
  elsif target_word.chars == game_instance.guess_progress
    puts "You got the magic word! You're a winner!"
    break
  elsif current_guess.length == 1
    puts "If your guess had matching characters, you'll see them revealed here: #{game_instance.guess_checker(current_guess)}"
    puts "You have #{remaining_guesses} remaining guesses."
  end
  remaining_guesses -= 1
  idx += 1
end

if target_word.chars != game_instance.guess_checker(current_guess)
  puts "You've failed us all. Go sit in the corner and face the wall while thinking hard about your pitiful performance."
end
