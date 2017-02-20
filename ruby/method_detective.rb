# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

p "iNvEsTiGaTiOn".swapcase
p "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”

p "zom".insert(1, "o")
# => “zoom”

p "enhance".center(15)
# => "    enhance    "

puts "Stop! You’re under arrest!".upcase
p "Stop! You’re under arrest!".upcase! #oddly when using p to print it treats
puts "Stop! You’re under arrest!".upcase! #demonstrating it works with puts
#the apstrophe rather strangely
# => "STOP! YOU’RE UNDER ARREST!"

p "the usual".ljust(18, " suspects")
p "the usual".insert(9, " suspects")
p "the usual" + " suspects"
p "the usual" << " suspects"
#=> "the usual suspects"

puts " "

p " suspects".insert(0, "the usual")
p " suspects".prepend("the usual")
# => "the usual suspects"

p "The case of the disappearing last letter".chomp("r")
p "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

p "The mystery of the missing first letter"[1..-1]
p "The mystery of the missing first letter".sub("T", "")
# => "he mystery of the missing first letter"

p "Elementary,    my   dear        Watson!".split.join(" ")
p "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

p "z".ord
# => 122
# (What is the significance of the number 122 in relation to the character z?)
#it is the characters listed position on the ASCII table

p "How many times does the letter 'a' appear in this string?".count("a")
# => 4
