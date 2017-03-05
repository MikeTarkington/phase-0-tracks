# -- THIS FIRST VERSION OF THE SANTA CLASS IS JUST FOR FOLLOWING THE LESSONS INSTRUCTIONS--
# -- THE BOTTOM ONE IS THE ACTUAL PROGRAM AND IT EVEN STORES THE RESULTS IN A HASH--

class Santa
  #syntax sugar for creating getter methods
  attr_reader :ethnicity, :age
  #syntax suggar for creating setter methods which actually also serve getter purposes
  attr_accessor :gender
  #attr_writer is another less common option that only allows writing but not reading

  def initialize(gender, ethnicity)
    p "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    p "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    p "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
      @reindeer_ranking.insert(@reindeer_ranking.length - 1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
      @reindeer_ranking
      #failed code:
      #@reindeer_ranking[@reindeer_ranking.length - 1] = @reindeer_ranking[@reindeer_ranking.index(reindeer_name)]
  end

  #a getter method - makes the instance variable readable outside the class
  # def gender
  #   @gender
  # end
  #
  # def age
  #   @age
  # end
  #
  # def ethnicity
  #   @ethnicity
  # end

  #a setter Method - makes the instance variable writable from outside class
  # def gender_update=(new_gender)
  #   @gender = new_gender
  # end

end

#--DRIVER CODE FOR AN INSTANCE--

santa0 = Santa.new("agender", "N/A")
santa0.speak
santa0.eat_milk_and_cookies("choco chip")
p santa0.celebrate_birthday
p santa0.get_mad_at("Dancer")
p santa0.age
p santa0.ethnicity

#accessing getter method from outside class
puts "original instance var accessed with getter is #{santa0.gender}"
#demonstrating use of setter methods outide class
p santa0.gender = "transgender"
#it appears that the result of a setter method cannot be interpolated via its direct method call so we just call the getter method after the value was updated
puts "now we can access the updated instance var with a getter method to see: #{santa0.gender}"

#--DBC EXAMPLE INITIALIZERS--
# a repl they offer: https://repl.it/CDS5

santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")

p santas

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

p santas

#--MY EXAMPLE INITIALIZERS--

idx = 0
santa_num = nil
santas = []
5.times do
  santa_num = "santa#{idx}"
  santas << santa_num
  santas << Santa.new("female", "Korean")
  idx += 1
end

p santas

santa_num = nil
santas = []
example_ethnicities.length.times do |i|
  santa_num = "santa#{i}"
  santas << santa_num
  santas << Santa.new("male", "Canadian")
end

p santas


# Messing with trying to feed array data to a hash as key value pairs.
# santa_hash = {}
# santa_idx = 0
# santa_attribute = 1
# santas.each do
#   santa_hash << { santas[santa_idx] => santas[santa_attribute] }
#   santa_idx += 6
#   santa_attribute += 6
# end
# p santa_hash


#-- RELEASE 4 INSTRUCTIONS --

# Write a program that creates lots of Santas. If you're on a cloud-based environment, you may not want to push it past about a hundred Santas. If you're on a faster computer, you may be able to make lots more than that. Play around with the numbers and see what happens.
#
# Obviously, no one wants to create ten thousand Santas by hand. That's what computers are for!
#
#- Use our array of example genders and an array of example ethnicities (and feel free to add to it if you like -- each array could have a lot more options in it!) to create your Santas with a randomly selected gender and a randomly selected ethnicity. (How do you randomly select an array item? The Array documentation should be able to help you out there!)

#- Set your new Santa's age to a random number between 0 and 140.

#- No need to store your Santas in a data structure, but your program should print out the attributes of each Santa using the instance methods that give you access to that data.

class Santa
  #syntax sugar for creating getter methods
  attr_reader :ethnicity
  #syntax suggar for creating setter methods which actually also serve getter purposes
  attr_accessor :gender, :age, :reindeer_ranking
  #attr_writer is another less common option that only allows writing but not reading

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = (1..140).to_a
  end

  def speak
    p "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    p "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
      @reindeer_ranking.insert(@reindeer_ranking.length - 1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
      @reindeer_ranking
      #failed code:
      #@reindeer_ranking[@reindeer_ranking.length - 1] = @reindeer_ranking[@reindeer_ranking.index(reindeer_name)]
  end

  #a getter method - makes the instance variable readable outside the class
  # def gender
  #   @gender
  # end
  #
  # def age
  #   @age
  # end
  #
  # def ethnicity
  #   @ethnicity
  # end

  #a setter Method - makes the instance variable writable from outside class
  # def gender_update=(new_gender)
  #   @gender = new_gender
  # end

end

santa_num = 0
santas = []
100.times do |santa|
  santa = "santa#{santa_num}"
  santas << santa
  santa_num += 1
end

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
santas_initialized = {}
idx = 0
santas.each do |santa_instance|
  santa_instance = Santa.new(example_genders.sample, example_ethnicities.sample)
  santa_instance.age = santa_instance.age.sample
  santa_instance.get_mad_at(santa_instance.reindeer_ranking.sample)
  santas_initialized[santas[idx]] = santa_instance
  idx += 1
  p santa_instance
end

p santas_initialized
