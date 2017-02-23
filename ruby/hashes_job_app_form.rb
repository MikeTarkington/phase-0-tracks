=begin
INTERIOR DESIGNER JOB APPLICATION

Name: __________________________________________
Address: _______________________________________
Email: _________________________________________
Phone: _________________________________________

Fave shade of blue: ____________________________

Wallpaper preferences (check any that apply):
▢ Paisley
▢ Chevrons
▢ Photorealistic woodsy scenes (with or without squirrels)
▢ Abstract woodsy scenes (no squirrels)

Ombre is:
◯ Fierce
◯ So last season
◯ Practically medieval in its appalling irrelevance

Imagine you are writing a program that must process the interior designer application above. What would a filled-out version of that form look like as a hash? Create a new Ruby file (call it what you like, you won't turn it in) and declare a hash that represents one person's application data.

Add driver code at the bottom of your file to update some values and maybe add in a new value for whether the person was hired.

What happens if store a key in a variable, then access the hash using the variable? Does it work?

What happens when try an expression like your_hash[:name] + your_hash[:address] (or whatever keys you used)?
Does it affect the original hash?

Come up with a few more questions about hashes, and use driver code or documentation to answer them.
=end

interior_designer_app = {
  name: "Pickles Von Weathersby",
  address: "2 Timbuk Two Avenue, Bermuda Triangle, CA. 94310",
  email: "bigphoney@email.com",
  phone: "415-215-7631",
  fav_shade: "indigo",
  wallpaper_pref: "Chevrons",
  ombre_type: "Fierce",
}

interior_designer_app[:name] = "Finn the Human"
interior_designer_app[:fav_shade] = "Cerulean"
interior_designer_app[:hire_status] = "Yes!"
interior_designer_app[:beemo_lover] = "Hell Yea!"

#adding the values from two keys in the hash didn't change the original hash
p interior_designer_app[:name] + interior_designer_app[:address]
#can you use interpolation to hash keys to interpolate their contents into a string? yes
p "#{interior_designer_app[:name]} lives at #{interior_designer_app[:address]}!"

p interior_designer_app
