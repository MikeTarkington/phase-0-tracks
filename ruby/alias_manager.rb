#create fake name by doing
#1. swapping first and last
#2. Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

def alias_maker(name)
  name_arr = name.split(" ")
  name_arr[0], name_arr[1] = name_arr[1], name_arr[0]
  #name_arr.map!(&:capitalize)
  vowels = "aeiou"
  vowels_arr = ["a", "e", "i", "o", "u"]
  consonants = "bcdeghjklmnpqrstvwxyz"
  idx = 0
  p alias_first = name_arr[0]
  alias_last = name_arr[1]
  alias_first.each_char do |alias_made|
    if alias_first.include? "aeiou" == true
      vowel_found = vowels[idx]
      replace_idx = alias_first.index(vowel_found)
      p next_vowel = vowels.index(vowel_found) + 1
      p new_vowel = vowels[next_vowel]
      unless new_vowel == "u"
        alias_made[replace_idx] = new_vowel
      else
        alias_made[replace_idx] = "a"
      end
      p alias_made
      p alias_first
    end
    idx += 1
  end

end

puts "What is the agents name?"
name = gets.chomp
p alias_maker(name)
