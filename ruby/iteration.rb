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
A method that iterates through the items, deleting any that meet a certain condition (for example, deleting any numbers that are less than 5).

A method that filters a data structure for only items that do satisfy a certain condition (for example, keeping any numbers that are less than 5).

A different method that filters a data structure for only items satisfying a certain condition -- Ruby offers several options!

A method that will remove items from a data structure until the condition in the block evaluates to false, then stops (you may not find a perfectly working option for the hash, and that's okay).
=end

numbers = [1, 2, 3, 4, 5,]
hasher = {
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
}

#array
def deleter
  numbers = [1, 2, 3, 4, 5,]
  numbers.each do |numbers|
    yield numbers
  end
end

deleter.delete_if {|numbers| numbers < 3 }

#hash
