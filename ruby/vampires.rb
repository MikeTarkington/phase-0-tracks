

#--segment--gathering applicant info and converting to apporpirate data types

puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

puts "What year were you born?"
birth_year = gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you (y/n)?"
garlic_bread = gets.chomp
if garlic_bread == "yes" || garlic_bread == "y"
	garlic_bread = true
else
	garlic_bread = false
end

puts "Would you like to enroll in the company’s health insurance (y/n)?"
insurance = gets.chomp
if insurance == "yes" || insurance == "y"
	insurance = true
else
	insurance = false
end

#--segment--determining whether or not they may have lied about their age
time = Time.new
#takes the current year and finds diff from birth year also accounting for 
#possibility they may be a year younger than that outcome since their birtdhay
#may not have come yet
if age == time.year - birth_year || age == (time.year - 1) - birth_year
	age_truth = true
else
	age_truth = false
end

#--segment--following code is for vampire detection

vamp_status = "Results inconclusive."

	#If the employee got their age right, and is willing to eat garlic bread or
	#sign up for insurance, the result is “Probably not a vampire.”
if age_truth == true && (garlic_bread == true || insurance == true)
	vamp_status = "Probably not a vampire."
end
	
	#If the employee got their age wrong, and hates garlic bread or waives insurance,
	#the result is “Probably a vampire.”
if age_truth == false && (garlic_bread == false || insurance == false)
	vamp_status = "Probably a vampire."
end
	
	#If the employee got their age wrong, hates garlic bread, and doesn’t want insurance,
	#the result is “Almost certainly a vampire.”
if age_truth == false && garlic_bread == false && insurance == false
	vamp_status = "Almost certainly a vampire."
end
	
	#Even if the employee is an amazing liar otherwise, anyone going by the name of “Drake Cula”
	#or “Tu Fang” is clearly a vampire, because come on. In that case, you should print
	#“Definitely a vampire.”
if name == "Drake Cula" || name == "Tu Fang"
	vamp_status = "Definitely a vampire."
end

puts vamp_status
