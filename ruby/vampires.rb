puts "WELCOME TO THE WEREWOLF INC. VAMPIRE APPLICANT DETECTION SYSTEM"
puts "How many applicants will processed in this session?"
applicants = gets.chomp.to_i

while applicants > 0

	#--segment--gathering applicant info and converting to apporpirate data types

	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	age = gets.chomp.to_i

	puts "What year were you born?"
	birth_year = gets.chomp.to_i

	#set variables for use in upoming loop
	sun_allergy = nil
	loop_state = nil
	
	#loop for determining if they have the sunshine allergy and setting a variable
	#called "sun_allergy" to be used later in the "vamp_status" assessment
	puts "Please name any allergies you may have? If you don't have any, or you're finished listing them enter \"done\"."
	    allergy = gets.chomp
	until loop_state == "done"
	    if allergy == "sunshine"
			sun_allergy = "yes"
			loop_state = "done"
		elsif allergy == "done"
			loop_state = "done"
		else
		  puts "Any additional allergies?"
		  allergy = gets.chomp
		end
	end

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

		#based on response from looped question asking for allergies
	if sun_allergy == "yes"
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

applicants -= 1

end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

