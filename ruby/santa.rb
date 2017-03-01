class Santa

  def initialize
    p "Initializing Santa instance ..."
  end

  def speak
    p "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    p "That was a good #{cookie_type}!"
  end

end

santa0 = Santa.new
santa0.speak
santa0.eat_milk_and_cookies("choco chip")
