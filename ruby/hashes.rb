=begin
pseudocode and write a program that will allow an interior designer to enter the details of a given client: the client's name, age, number of children, decor theme, and so on (you can choose your own as long as it's a good mix of string, integer, and boolean data).

Your keys should be symbols unless you find that you need a string for some reason -- usually only when spaces or other "user friendly" formatting are needed (as in the case of using someone's full name as a hash key). Basically, symbols are simpler for programmers to use, and readable enough by technical folks to be used in place of strings most of the time.

Your program should ...
- Prompt the designer/user for all of this information.
- Convert any user input to the appropriate data type.
- Print the hash back out to the screen when the designer has answered all of the questions.
- Give the user the opportunity to update a key (no need to loop, once is fine). After all, sometimes users make mistakes! If the designer says "none", skip it. But if the designer enters "decor_theme" (for example), your program should ask for a new value and update the :decor_theme key. (Hint: Strings have methods that will turn them into symbols, which would be quite handy here.) You can assume the user will correctly input a key that exists in your hash -- no need to handle user errors.
Print the latest version of the hash, and exit the program.
Be sure to pseudocode, and leave your pseudocode in as comments.
=end

client_info = Hash.new("N/A")

client_info = {
  name: "N/A",
  age: "N/A",
  address: "N/A",
  children: "N/A",
  child_count: "N/A",
  decor_theme: "N/A",
  spend_target: "N/A",
  fav_colors: "N/A",
}

puts ""

puts "WELCOME TO THE INTERIOR DESIGN CLIENT INFO SYSTEM"
puts ""
puts "Answer the following questions about your client..."

#INTERIOR DESIGNER USER INPUTS

puts "Enter their full name:"
client_info[:name] = gets.chomp.capitalize
puts "If \"#{client_info[:name]}\" is correct type \"y\", if not type \"n\" to re-enter."
correct = gets.chomp
if correct == "y"
  client_info[:name]
elsif correct == "n"
  puts "What is the correct full name:"
  client_info[:name] = gets.chomp.capitalize
else
  puts "You didn't enter y or n... you stink!"
end

puts "Enter their age:"
client_info[:age] = gets.chomp.to_i
puts "If \"#{client_info[:age]}\" is correct type \"y\", if not type \"n\" to re-enter."
correct = gets.chomp
if correct == "y"
  client_info[:age]
elsif correct == "n"
  puts "What is the correct age:"
  client_info[:age] = gets.chomp.to_i
else
  puts "You didn't enter y or n... to the choppin block with ya!"
end

puts "Enter their street address:"
client_info[:address] = gets.chomp
puts "If \"#{client_info[:address]}\" is correct type \"y\", if not type \"n\" to re-enter."
correct = gets.chomp
if correct == "y"
  client_info[:address]
elsif correct == "n"
  puts "What is the correct address:"
  client_info[:address] = gets.chomp
else
  puts "You didn't enter y or n... you're a bad user!"
end

puts "Do they have children? Type \"y\" or \"n\"."
client_info[:children] = gets.chomp
if client_info[:children] == "y"
  client_info[:children] = true
elsif client_info[:children] == "n"
  client_info[:children] = false
else
  puts "You didn't answer \"y\" or \"n\".  Please learn to follow basic instructions."
end
if client_info[:children] == true
  puts "How many children?"
  client_info[:child_count] = gets.chomp.to_i
end

puts "Enter their decor theme:"
client_info[:decor_theme] = gets.chomp
puts "If \"#{client_info[:decor_theme]}\" is correct type \"y\", if not type \"n\" to re-enter."
correct = gets.chomp
if correct == "y"
  client_info[:decor_theme]
elsif correct == "n"
  puts "What is the correct decor theme:"
  client_info[:decor_theme] = gets.chomp
else
  puts "You didn't enter y or n... you must not have any sense of decor."
end

puts "Enter their target cost for the project (digits only):"
client_info[:spend_target] = gets.chomp.to_f
puts "If \"#{client_info[:spend_target]}\" is correct type \"y\", if not type \"n\" to re-enter."
correct = gets.chomp
if correct == "y"
  client_info[:spend_target]
elsif correct == "n"
  puts "What is the correct spending target (digits only):"
  client_info[:spend_target] = gets.chomp.to_f
else
  puts "You didn't enter y or n... what is the meaning of this!"
end

puts "Enter their favorite colors (type \"done\" when finished listing):"
arr_fav_colors = []
until client_info[:fav_colors] == "done"
  puts "Color:"
  client_info[:fav_colors] = gets.chomp
  puts "If \"#{client_info[:fav_colors]}\" is correct type \"y\", if not type \"n\" to re-enter."
  correct = gets.chomp
  if correct == "y"
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  elsif correct == "n"
    puts "What is the correct color:"
    client_info[:name] = gets.chomp
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  else
    puts "You didn't enter y or n... but that's totally okay... You do you."
  end
end


puts ""
puts client_info
