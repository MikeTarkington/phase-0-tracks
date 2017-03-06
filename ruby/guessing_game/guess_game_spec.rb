require_relative 'guess_game'

describe GuessGame do
  let(:game_instance) { GuessGame.new("testing") }

  it "returns string which is created out of altered array when character matches are found" do
    expect(game_instance.guess_checker("s")).to eq "_ _ s _ _ _ _"
  end

  it "modify index corresponding index position if multiple character matches are found for the users guess" do
    expect(game_instance.guess_checker("t")).to eq "t _ _ t _ _ _"
  end

  it "if the user guesses the entire word before running out of opportunities to guess should give message for success" do
    expect(game_instance.guess_checker("testing")).to eq "Holy macaroni! You guessed the magic word! You're a winner!"
  end

end
