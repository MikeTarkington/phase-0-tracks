puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birth_year = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_bread = gets.chomp
if garlic_bread = "yes" || garlic_bread == "y"
	garlic_bread = true
else
	garlic_bread = false
end

puts "Would you like to enroll in the company’s health insurance?"
insurance = gets.chomp
if insurance = "yes" || insurance == "y"
	insurance = true
else
	insurance = false
end
