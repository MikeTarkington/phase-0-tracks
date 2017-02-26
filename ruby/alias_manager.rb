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
  p alias_first = name_arr[0].chars
  alias_last = name_arr[1].chars
  first_alias_done = []
  last_alias_done = []

  alias_first.each do |alias_chr|
    if alias_chr == "a"
     first_alias_done << "e"
    elsif alias_chr == "e"
      first_alias_done << "i"
    elsif alias_chr == "i"
      first_alias_done << "o"
    elsif alias_chr == "o"
      first_alias_done << "u"
    elsif alias_chr == "u"
      first_alias_done << "a"
    else
      unless alias_chr == "z"
        first_alias_done << alias_chr.next
      else
        first_alias_done << "a"
      end
    end
  end

  alias_last.each do |alias_chr|
    if alias_chr == "a"
     last_alias_done << "e"
    elsif alias_chr == "e"
      last_alias_done << "i"
    elsif alias_chr == "i"
      last_alias_done << "o"
    elsif alias_chr == "o"
      last_alias_done << "u"
    elsif alias_chr == "u"
      last_alias_done << "a"
    else
      unless alias_chr == "z"
        last_alias_done << alias_chr.next
      else
        last_alias_done << "a"
      end
    end
  end
p first_alias_done
p last_alias_done
return first_alias_done.join("").capitalize + " " + last_alias_done.join("").capitalize
end

puts "What is the agents name?"
name = gets.chomp
p alias_maker(name)

#initial brainstorms some of which was basically aborted
=begin
def alias_maker(name)
  name_arr = name.split(" ")
  name_arr[0], name_arr[1] = name_arr[1], name_arr[0]
  #name_arr.map!(&:capitalize)
  vowels = "aeiou"
  vowels_arr = ["a", "e", "i", "o", "u"]
  consonants = "bcdeghjklmnpqrstvwxyz"
  idx = 0
  alias_first = name_arr[0]
  alias_last = name_arr[1]
  first_alias_done = alias_first

  alias_first.each_char do |alias_idx|
    if alias_first.include?(vowels[idx])
      p vowel_found = vowels[idx]
      puts " "
      p replace_idx = alias_first.index(vowel_found)
      puts " "
      alias_idx = replace_idx
      p next_vowel = vowels.index(vowel_found) + 1
      p new_vowel = vowels[next_vowel]
      unless new_vowel == "u"
        first_alias_done[alias_idx] = new_vowel
      else
        first_alias_done[alias_idx] = "a"
      end
      p first_alias_done
      p alias_first
    end
    idx += 1
  end

end

puts "What is the agents name?"
name = gets.chomp
p alias_maker(name)
=end
