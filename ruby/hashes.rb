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

#creating hash with default key values
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
#begins interface
puts "WELCOME TO THE INTERIOR DESIGN CLIENT INFO SYSTEM"
puts "warning: this program can be a real jerk if you answer incorrectly... good luck."
puts ""
puts "Answer the following questions about your client..."

#INTERIOR DESIGNER USER INPUTS

#gathers full name and capitalizes the first letter (lazily not the second)
#then inerpolates their response into a question for confirmation offering them
#the opportunity use a different answer thus reassigning the key value again
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

#same process as above but for age and coercion into a interger
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

#continued process with question for address
puts "Enter their address:"
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

#question whether or not they have children and conditional flow offering theme
#another question about how many children if they answered yes
#the number of children response is coerced into an integer
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

#same process for their decor theme as for previous questions answered with a
#string
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

#same process for asking their target cost accept that it coerces to a float
#data type since currency values are commonly stored that way
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

#we hadn't covered nested data structures yet but I was curious to try getting
#an array to be stored as a hash key value... so i did
#it even gives them a chance to correct each color entry as they're doing it
#they can add as many colors as they want
puts "Enter their favorite colors:"
arr_fav_colors = []
idx = 0
until correct == "done"
  puts "Color:"
  client_info[:fav_colors] = gets.chomp
  puts "If \"#{client_info[:fav_colors]}\" is correct type \"y\", if not type \"n\" to re-enter. (type \"done\" when finished listing)"
  correct = gets.chomp
  if correct == "y"
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  elsif correct == "n"
    puts "What is the correct color:"
    client_info[:fav_colors] = gets.chomp
    arr_fav_colors[idx] = client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  elsif correct == "done"
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  else
    puts "You didn't enter y or n... but that's totally okay... You do you."
  end
  idx += 1
end

#per the instructions, I added an opportunity for the user to change any of the
#previously set key values
#nested control flow allows them to pick a hash key value they want to edit
#and then it gives them a quick way to provide the update depending on which
#value they chose to modify
#if they don't want to change anything they type "none"
puts "If you'd like to update any of the client data, type the corresponding item: name, age, address, children, child count, decor theme, spend target, or favorite colors (if no updates are needed type \"none\"):"
edit_pref = gets.chomp
if edit_pref == "name"
  puts "What is the updated name?"
  client_info[:name] = gets.chomp
elsif edit_pref == "age"
  puts "What is the updated age?"
  client_info[:age] = gets.chomp.to_i
elsif edit_pref == "address"
  puts "What is the updated address?"
  client_info[:address] = gets.chomp
elsif edit_pref == "children"
  puts "Do they have children \"y\" or \"n\"?"
  client_info[:children] = gets.chomp
  if client_info[:children] == "y"
    client_info[:children] = true
  elsif client_info[:children] == "n"
    client_info[:children] = false
  else
    puts "That answer sucked.. better luck next time."
  end
elsif edit_pref == "child count"
  puts "How many children do they have?"
  client_info[:child_count] = gets.chomp.to_i
elsif edit_pref == "decor theme"
  puts "What is their decore theme?"
  client_info[:decor_theme] = gets.chomp
elsif edit_pref == "spend target"
  puts "What is the updated spending target (digits only)?"
  client_info[:spend_target] = gets.chomp.to_f
elsif edit_pref == "favorite colors"
  puts "Enter their favorite colors:"
  arr_fav_colors = []
color_status = nil
until color_status == "done"
  puts "Color:"
  client_info[:fav_colors] = gets.chomp
  puts "Type \"next\" to enter another or \"done\" when finished listing:"
  color_status = gets.chomp
  if color_status == "next"
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  elsif color_status == "done"
    arr_fav_colors << client_info[:fav_colors]
    client_info[:fav_colors] = arr_fav_colors
  else
    puts "You didn't enter y or n... but that's totally okay... You do you."
  end
end
elsif edit_pref == "none"
  puts "You made it through using this program.  Hope it didn't hurt too much."
else
  puts "That's not one of the options.  Restart the program to update further. Buh bye"
end

puts ""
puts client_info
