class Santa

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

end

santa0 = Santa.new("agender", "N/A")
santa0.speak
santa0.eat_milk_and_cookies("choco chip")

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
