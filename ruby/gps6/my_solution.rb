# Virus Predictor

# I worked on this challenge [by myself, with: Blake Wills].
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
# Sets requirement that this file be connected to the corresponding named file
# situated in the same directory.
# Require allows for connections to be made with files outside the directory but
# depends on a more specific declaration of the file path location whether local
# or hosted over the internet.

require_relative 'state_data'

class VirusPredictor

  #enables class to create instances with 3 arguments which set the base attributes of an instance
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @number_of_deaths = 0
    @speed = 0
  end

  #it calls a method for mathematic processing based on conditional logic and the next two subsequent methods and uses instance variables as arguments for the print statements of those methods
  def virus_effects
    projection_generator
    predicted_deaths
    speed_of_spread
  end

  private

#this is the method used to refactor the predicted_deaths and speed_of_spread methods so that they no longer repeat conditional logic.
  def projection_generator
    if @population_density >= 200
      @number_of_deaths = (@population * 0.4).floor
      @speed += 0.5
    elsif @population_density >= 150
      @number_of_deaths = (@population * 0.3).floor
      @speed += 1
    elsif @population_density >= 100
      @number_of_deaths = (@population * 0.2).floor
      @speed += 1.5
    elsif @population_density >= 50
      @number_of_deaths = (@population * 0.1).floor
      @speed += 2
    else
      @number_of_deaths = (@population * 0.05).floor
      @speed += 2.5
    end
  end

  #prints a statement including interpolated instance variables based on calculations from projection_generator
  def predicted_deaths
    # predicted deaths is solely based on population density
    # if @population_density >= 200
    #   number_of_deaths = (@population * 0.4).floor
    # elsif @population_density >= 150
    #   number_of_deaths = (@population * 0.3).floor
    # elsif @population_density >= 100
    #   number_of_deaths = (@population * 0.2).floor
    # elsif @population_density >= 50
    #   number_of_deaths = (@population * 0.1).floor
    # else
    #   number_of_deaths = (@population * 0.05).floor
    # end

    print "#{@state} will lose #{@number_of_deaths} people in this outbreak"

  end

  #prints a statement included interpolated instance variables based on calculations from projection_generator
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    # if @population_density >= 200
    #   speed += 0.5
    # elsif @population_density >= 150
    #   speed += 1
    # elsif @population_density >= 100
    #   speed += 1.5
    # elsif @population_density >= 50
    #   speed += 2
    # else
    #   speed += 2.5
    # end

    puts " and will spread across the state in #{@speed} months.\n\n"

  end


end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, state_data|
  instance = VirusPredictor.new(state, state_data[:population_density], state_data[:population])
  instance.virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects
#
# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects
#
# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects
#
# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects



#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes shown in the state_data file?
- There is syntax used for keys which are strings and keys which are symbols.  The main difference is that symols are immutable and can save processing power (and therefor improve speed) if they are used repeatedly and their object ID doesn't need to be unique.  Srings have their object ID for each occurance of the same string and they come with more versatile editing feature which can unnecessarily slow down processing.

What does require_relative do? How is it different from require?
- Require relative sets requirement that this file be connected to the corresponding named file situated in the same directory. Require allows for connections to be made with files outside the directory but depends on a more specific declaration of the file path location whether local or hosted over the internet.

What are some ways to iterate through a hash?
- Using a loop or a built in method such as `.each` or `.map`

When refactoring virus_effects, what stood out to you about the variables, if anything?
- No arguments needed to be passed in because it only utilized method calls of other methods wihin the class.  Furthermore, the implicit return of virus_effects wasn't important because the methods that were called trigger print statements.

What concept did you most solidify in this challenge?
- Use of require vs require_relative was a very useful lesson.  I also gained a better undrestanding of when we don't actually need to have arguments passed to a method becuase the method uses instance variables which persist through the instance of that class and are defined at the initialization as class attributes.  It was also great to have more practice learning to use hashes within hashes and solidify my understanding of when to use a symbol vs a string for a key.

=end
