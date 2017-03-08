class ExampleClass

	attr_accessor :user_input

	def initialize
		@instance_var = 0
		@user_input = " "
	end

	def example_method(user_input)
    user_input = gets.chomp
    @user_input = user_input
	end
end

example_instance = ExampleClass.new
puts "Enter the word \"testing\":"
p example_instance.example_method("default")
