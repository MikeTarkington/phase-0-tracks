=begin
Design and build a nested data structure to represent a real-world construct. You can choose the construct: Is it a highway full of cars full of people? A classroom full of desks full of supplies? A fashion show with multiple runways featuring multiple models? Build something that will use a mix of hashes and arrays.

Once you've built it, print a few individual pieces of deeply nested data from the structure, showing that you know how to use multiple indexes or hash keys (or both) to access nested items. Try to demonstrate a few different types of access.
=end

movie_stuff = {
  some_favorites: {
    genre: {
      drama: ["Shawshank Redemption", "Whiplash", "Forest Gump"],
      action: ["Fight Club", "Die Hard", "The Dark Knight"],
      romance: ["Titanic", "Eternal Sunchine of a Spotless Mind", "Sleepless in Seattle"],
      horror: ["Nightmare on Elm Street", "Poltergeist", "Evil Dead 2"],
    },
  },
  recent_views: {
    2016.to_s.to_sym => {
      genre: {
        drama: ["Shawshank Redemption", "Whiplash", "Forest Gump"],
        action: ["Fight Club", "Die Hard", "The Dark Knight"],
        romance: ["Titanic", "Eternal Sunchine of a Spotless Mind", "Sleepless in Seattle"],
        horror: ["Nightmare on Elm Street", "Poltergeist", "Evil Dead 2"],
      },
    },
    2017.to_s.to_sym => {
      genre: {
        drama: ["Shawshank Redemption", "Whiplash", "Forest Gump"],
        action: ["Fight Club", "Die Hard", "The Dark Knight"],
        romance: ["Titanic", "Eternal Sunchine of a Spotless Mind", "Sleepless in Seattle"],
        horror: ["Nightmare on Elm Street", "Poltergeist", "Evil Dead 2"],
      },
    },
  },
}


puts " "
#prints Whiplash from my list of favorites in the drama genre
p movie_stuff[:some_favorites][:genre][:drama][1]
puts " "
#prints the horror genre array from the favorites list
p movie_stuff[:some_favorites][:genre][:horror]
puts " "
#prints a reverse order of the array from the action genre of movies viewed in 2016
p movie_stuff[:recent_views][2016.to_s.to_sym][:genre][:action].reverse
puts " "
#takes the string "Eternal Sunshine of a Spotless Mind" from the recent views of 2017 romance genre array, and then breaks the string into an array with .map, capitalizes each word, and then rejoins the array into a string with the letters from "Of" and "A" now capitalized.  Also reassigns to the index of the original movie title altering the contents of the array printed aftrwards.  A funny line of code I sorta wanted to get away with.
p movie_stuff[:recent_views][2017.to_s.to_sym][:genre][:romance][1] = movie_stuff[:recent_views][2017.to_s.to_sym][:genre][:romance][1].split(" ").map {|movie| movie.capitalize }.join(" ")
#prints the array with the now capitalized letters for that particular movie title
p movie_stuff[:recent_views][2017.to_s.to_sym][:genre][:romance]
