class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(x)
    puts "Woof! " * x
    x
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years (x)
    x = x * 7
  end

  def fur(color, texture, length)
    puts "My puppy's fur is #{texture}, #{color}, and #{length}!"
  end

  def initialize
    puts "Initializing new puppy instance ..."
  end

end

spot = Puppy.new
spot.fetch("ball")
spot.speak(3)
spot.roll_over
p spot.dog_years(21)
spot.fur("soft", "white w/brown spots", "short")

#--SEPARATE CLASS EXPERIMENT--



class Spider

  def initialize
    puts "initialized"
  end

  def species(varies)
    puts "Your species is #{varies}"
    return varies
  end

  def jump(height, distance)
    puts attack_range = height * distance
    return attack_range
  end

  def bite(severity)
    if severity == "mild"
      puts "Walk it off!"
    elsif severity == "bad"
      puts "Get to a doctor!"
    elsif severity == "nightmare"
      puts "Call the coroner..."
    else
      puts "Maybe it was a scorpion?"
    end
    return severity
  end

end

#--DRIVER CODE FOR TESTING THE METHODS-- successful
# betsy = Spider.new
# betsy.species("camel")
# p betsy.jump(5, 10)
# betsy.bite("nightmare")

spider_records = []
instance_num = 0
while instance_num < 50
  spider_records << "spider#{instance_num}" #considering refactoring w/hashes or arrays delineated by this "spider(number)" as a hash key or some form of upper tier array that would include corresponding info about the individual spider
  spider = Spider.new
  instance_num += 1
end

p spider_records

spider_files = []
spider_records.each do |spider_num|
  spider_files << spider.species("brown recluse")
  spider_files << spider.jump(5, 10)
  spider_files << spider.bite("nightmare")
end

p spider_files

=begin
class Employee

  def initialize
    puts "Initializing new employee record..."
  end

  def name(name)
    name = name.split(" ")
    name = name[0].capitalize + " " + name[1].capitalize
  end

  def age(x)
    employee_age = x
  end

  def experience(x)
    experience = "#{x}yrs"
  end

end

employee = Employee.new
p employee.name("fredrick harris")
p employee.age(35)
p employee.experience(3)

employee_record = {
    name: "none",
    age: "none",
    yrs_experience: "none",
}

employee = ""
instance_num = 0
class_count = 0
while class_count < 50
  employee = Employee.new
  employee_record[:name] << employee.name("fredrick harris")
  employee_record[:age] << employee.age(35)
  employee_record[:yrs_experience] << employee.experience(3)
  employee_record
  instance_num += 1
  class_count += 1
end

p employee_record


#experimental
=begin
class Employee

@@employee_record = Hash.new("N/A")
@@employee_record = {
  f_name: "none",
  l_name: "none",
  age: "none",
  yrs_experience: "none",
}

  def initialize
    puts "Initializing new employee record..."
    puts "Employee first name:"
    f_name = gets.chomp
    @@employee_record[:f_name] = f_name
    puts "Employee last name:"
    l_name = gets.chomp
    @@employee_record[:f_name] = f_name

  end

  def age(x)
    employee_age = x
    @@employee_record[:age] = employee_age
  end

end

class_count = 0
while class_count < 50
=end
