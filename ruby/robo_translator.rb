#ROBOT TRANSLATOR

#If a letter is capitalized and it's in the first half of the alphabet,
#it becomes "bloop"

# Otherwise, if a letter is capitalized or it's the letter "e", it beocomes
#"buzz"

#If it's not a letter at all it becomes "boing"

# Otherwise, it becomes "beep"

#"Happy Halloween!" => "bloopbeepbeepbeepbeepboingbloopbeepbeepbeepbeepbeepbuzzbuzzbeepboing"


def translator(phrase)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  idx = 0
  translation = ""
  while idx < phrase.length
    if alpha.index(phrase[idx].downcase) == nil
      translation += " boing"
    elsif alpha.index(phrase[idx].downcase) < alpha.length / 2 && /[[:upper:]]/ =~ phrase[idx]
      translation += " bloop"
    elsif phrase[idx] == "e" || /[[:upper:]]/ =~ phrase[idx]
      translation += " buzz"
    else
      translation += " beep"
    end
    idx += 1
  end
  return translation
end

p translator("Jake the Dog!")
p translator("Finn the Human!")
p translator("Happy Halloween!")
