require_relative 'cmd_input_pass_test'

describe ExampleClass do
  let(:test_instance) { GuessGame.new }

  it "returns whatever the user entered via command prompt" do
    expect(test_instance.guess_checker(user_input)).to eq "testing"
  end

end
