
#SECRET AGENT PASSWORD ENCRYPTION/DECRYPTION TOOL

#BUSINESS LOGIC

def encrypt(secret_password)
  #creating loop advancing characters of a string one index forward
  #declare variables for use in loop
  index = 0
  #initiate loop that increments the index up to the length of the
  #password so that the process is run on each character
  while index < secret_password.length
    #For each index position of the string we reassigned the value to the
    #next alphabetical order index value
    unless secret_password[index] == "z"
      secret_password[index] = secret_password[index].next
    end
    if secret_password[index] == "!"
      secret_password[index] = " "
      elsif secret_password[index] == "z"
      secret_password[index] = "a"
    end
    encrypted_pw = secret_password
    index += 1
  end
  return encrypted_pw
end

def decrypt(encrypted_pw)
#Variable for the alphabet for a point of ref for decrypt
alpha = "abcdefghijklmnopqrstuvwxyz"
#created variable pw_char to be used
pw_char = nil
decrypted_pw = ""
decrypt_idx = 0
index = 0
  while index < encrypted_pw.length
    #Code for decrypting spaces
    unless encrypted_pw[index] == " " || encrypted_pw[index] == nil
    #assign index position char of encrypted_pw to pw_char variable
    pw_char = encrypted_pw[index]
    #decrypt_idx is being set the index position of the alphabet indicated by
    #the letter stored in pw_char
    decrypt_idx = alpha.index(pw_char)
    #subtract index by 1 and store new value
    decrypt_idx -= 1
    #Build the return value by adding each iterated character to a variable
    decrypted_pw += alpha[decrypt_idx]
    else
      decrypted_pw[index] = " "
      #Using new position to read the alphabet and adding each character from
      #indexes that are processed through the loop
    end
    index += 1
  end
return decrypted_pw
end

#USER INTERFACE

#sets value to be used in loop that will restart the program if user enters
#something other than e for encrypt or d for decrypt
encrypt_pref = ""
until encrypt_pref == "e" || encrypt_pref == "d"
  puts "Would you like to encrypt or decrypt a password? Type \"e\" or \"d\"."
  #Gathers user desired encryption or decryption preference
  encrypt_pref = gets.chomp
  #sets conditional loop that prompts user to re-enter proper input
  unless encrypt_pref == "e" || encrypt_pref == "d"
    puts "Does not compute. Must select \"e\" or \"d\"."
  end
end

puts "What is your password?"
#Gathers user password
password = gets.chomp
#Prints encrypted or decrypted password within string interpolated method call
#depending on user request for either method process
if encrypt_pref == "e"
  puts "Your encrypted password is: #{encrypt(password)}"
elsif encrypt_pref == "d"
  puts "Your decrypted password is: #{decrypt(password)}"
end


=begin
puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")
puts decrypt(encrypt("swordfish"))
=end

=begin
#Another shorter version of the decrypt method written by another student...
#I had ideas similar to this but when I psudo coded my plans initially it broke
#up the problem more than necesssary for the step by step code I wound up with
#in the above solution
#it's included here as food for thought
def decrypt(password)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    index = 0
    while index < password.length
        #letter in alphabet of that index number - 1(number of of that letter in the alphabet(letter_original)-1)
        password[index] = alphabet[(alphabet.index(password[index]))-1]
        index += 1
    end
    puts password
end
=end
