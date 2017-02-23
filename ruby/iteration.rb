puts "Our method:"
def block_taker
  puts "before"
  yield
  puts "after"
end

block_taker { puts "this is the block" }

=begin
In phase-0-tracks/ruby/iteration.rb, declare an array and a hash, and populate each of them with some data. We don't care what data you use, but it shouldn't be nonsense data -- it should represent a reasonable scenario in which those data structures would be used. (A hash full of random letters and numbers, for instance, is not as meaningful as a hash that associates Hollywood actors with their best-known character.)

Demonstrate that you can iterate through each one using .each, and then using .map! (modifying the data in some way). Note that you can't call .map! on a hash, so you can skip that (.map returns an array, so a destructive map method is logically impossible on a hash). Print the data structures before and after each call to demonstrate whether they have been modified or not.
=end


colors = [ "blue", "green", "purple", "red", ] # .each and .map!
pets = {          #.each
  cat: "mittens",
  dog: "paris",
  fish: "bass",
  hamster: "freckles",
}

new_colors = []
colors.each do |color|
  new_colors << color.upcase
end

p new_colors

colors.map! do |color|
  color.prepend("#")
  color.upcase
end

p colors

pets.each do |species, name|
  pets[species] = name.upcase
  puts name
end

p pets

=begin
Use the documentation to find other Array and Hash methods that take blocks, and that can accomplish the tasks below, then add sample calls to phase-0-tracks/ruby/iteration.rb -- one for the array, and one for the hash.

You can use simple (nonmeaningful) data for your example calls -- an array of integers or letters would be fine, for instance.

1. A method that iterates through the items, deleting any that meet a certain condition (for example, deleting any numbers that are less than 5).

2. A method that filters a data structure for only items that do satisfy a certain condition (for example, keeping any numbers that are less than 5).

3. A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

4. A method that will remove items from a data structure until the condition in the block evaluates to false, then stops (you may not find a perfectly working option for the hash, and that's okay).
=end

numbers_1 = [1, 2, 3, 4, 5, 6, 7, 8,]
numbers_2 = [1, 2, 3, 4, 5, 6, 7, 8,]
numbers_3 = [1, 2, 3, 4, 5, 6, 7, 8,]
numbers_4 = [1, 2, 3, 4, 5, 6, 7, 8,]

num_hash_1 = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8,}
num_hash_2 = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8,}
num_hash_3 = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8,}
num_hash_4 = {one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8,}

#1
#array
p numbers_1.delete_if {|numbers| numbers < 5 }
#hash
p num_hash_1.delete_if {|word, numeral| word.length > 3 }

=begin
#another alternative for delete_if could be .reject
p numbers_2.reject {|numbers| numbers > 5 }
#hash
p num_hash_2.reject {|word, numeral| numeral.even? }
=end

#2
#array
p numbers_2.keep_if {|numbers| numbers > 5 }
#hash
p num_hash_2.keep_if {|word, numeral| numeral.even? }

#3
#array
p numbers_3.select {|numbers| numbers.odd? }
#hash
p num_hash_3.select {|word, numeral| numeral == 3 || numeral == 6 }

#4
#array
p numbers_4.drop_while {|number| number != 4 }
#hash
p num_hash_4.drop_while {|word, numeral| word.size < 5 }

#.take_while is an interesting opposite to drop_while
