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
      "Holy macaroni! You guessed the magic word!"
    else
      @target_word.each do |char_guess|
        if char_guess == user_guess
          @guess_progress[idx] = user_guess
        end
        idx += 1
      end
      @guess_progress
    end
  end

end

test_init = GuessGame.new("testing")
#argument of a character or full word will be passed to guess checker
p test_init.guess_checker("s")
p test_init.guess_checker("t")
p test_init.guess_checker("testing")
