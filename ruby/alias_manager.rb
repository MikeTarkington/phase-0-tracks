#create fake name by doing
#1. swapping first and last
#2. Changing all of the vowels (a, e, i, o, or u) to the next vowel in 'aeiou', and all of the consonants (everything else besides the vowels) to the next consonant in the alphabet. So 'a' would become 'e', 'u' would become 'a', and 'd' would become 'f'.

#BUSINESS CODE

def alias_maker(name)
  name_arr = name.split(" ")
  name_arr[0], name_arr[1] = name_arr[1], name_arr[0]
  #some junk code I didn't need in the end but is relevant to other strategies I
  #may have taken
  #name_arr.map!(&:capitalize)
  # vowels = "aeiou"
  # vowels_arr = ["a", "e", "i", "o", "u"]
  # consonants = "bcdeghjklmnpqrstvwxyz"
  # idx = 0
  alias_first = name_arr[0].chars
  alias_last = name_arr[1].chars
  first_alias_done = []
  last_alias_done = []

#stores converted version of array in a new variable
#iterates through name as it is borken into an array
#accounts for vowels being changed to their next vowel in the "aeiou" order with
#with the edge case of "u" being "a"
#also accounts for
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
      if alias_chr == "z"
        first_alias_done << "a"
      elsif alias_chr.next == "e"
        first_alias_done << alias_chr.next.next
      elsif alias_chr.next == "i"
        first_alias_done << alias_chr.next.next
      elsif alias_chr.next == "o"
        first_alias_done << alias_chr.next.next
      elsif alias_chr.next == "u"
        first_alias_done << alias_chr.next.next
      else
        first_alias_done << alias_chr.next
      end
    end
  end

#I know I could refactor to make this one name conversion method instead of writing
#two separate blocks for it, I just didn't have much time left over and copy/paste
#involved less thought/effort
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
      if alias_chr == "z"
        last_alias_done << "a"
      elsif alias_chr.next == "e"
        last_alias_done << alias_chr.next.next
      elsif alias_chr.next == "i"
        last_alias_done << alias_chr.next.next
      elsif alias_chr.next == "o"
        last_alias_done << alias_chr.next.next
      elsif alias_chr.next == "u"
        last_alias_done << alias_chr.next.next
      else
        last_alias_done << alias_chr.next
      end
    end
  end
return first_alias_done.join("").capitalize + " " + last_alias_done.join("").capitalize
end

#USER INTERFACE

status = ""
stored_aliases = []
statements = []
loop do
  puts "What is the agents first and last name (separated only by a space)?"
  name = gets.chomp.downcase
  puts "The alias is: #{alias_maker(name)}"
  puts "Type \"quit\" if you're done entering names, or hit enter to continue:"
  status = gets.chomp
  stored_aliases << alias_maker(name)
  statements << "Agent #{name} is now aka #{alias_maker(name)}"
  if status == "quit"
    break
  end
end

puts statements







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
