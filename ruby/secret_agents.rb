
def encrypt(secret_password)
  #creating loop advancing characters of a string one index forward
  #declare variables for use in loop
  index = 0
  #initiate loop that increments the index up to the length of the
  #password so that the process is run on each character
  while index < secret_password.length
    #For each index position of the string we reassigned the value to the next alphabetical order index value
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
=begin 
    #Experimental code for decrypting spaces
    if encrypted_pw[index] == " "
      encrypted_pw[index] = 0
    end
=end
    #assign index position char of encrypted_pw to pw_char variable
    pw_char = encrypted_pw[index]
    #decrypt_idx is being set the index position of the alphabet indicated by the letter stored in pw_char
    decrypt_idx = alpha.index(pw_char)
    #subtract index by 1 and store new value
    decrypt_idx -= 1
    #Using new position to read the alphabet and adding each character from indexes that are processed through the loop
    decrypted_pw += alpha[decrypt_idx]
  index += 1
  end
return decrypted_pw
end

puts "Would you like to encrypt or decrypt a password? Type \"e\" or \"d\"."
encrypt_pref = gets.chomp
puts "What is your password?"
password = gets.chomp
if encrypt_pref == "e"
  puts encrypt(password)
elsif encrypt_pref == "d"
  puts decrypt(password)
else
  puts "Does not compute."
end

=begin
puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")
puts decrypt(encrypt("swordfish"))
=end