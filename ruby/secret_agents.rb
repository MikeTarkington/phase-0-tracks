def encrypt(secret_password)
	#creating loop advancing characters of a string one index forward

	#declare variables for use in loop
	index = 0
	#initiate loop that increments the index up to the length of the
	#password so that the process is run on each character
	while index < secret_password.length
		#For each index position of the string we reassigned the value to the next alphabetical order index value
	  secret_password[index] = secret_password[index].next
	  encrypted_pw = secret_password
	  if secret_password[index] == "!"
	  	secret_password[index] = " "
	  end
	  index += 1
	end
	return encrypted_pw
end

def decrypt(encrypted_pw)

alpha = "abcdefghijklmnopqrstuvwxyz"
pw_char = nil
decrypted_pw = ""
decrypt_idx = 0
index = 0

	while index < encrypted_pw.length
		#if encrypted_pw[index] == " "
			#encrypted_pw[index] = 0
		#end
		
		#find character to feed to our alphabet index -1 code
		pw_char = encrypted_pw[index]
		#find value of a
		decrypt_idx = alpha.index(pw_char)
		decrypt_idx -= 1
		alpha[decrypt_idx]
		decrypted_pw += alpha[decrypt_idx]

	index += 1
		
	end
return decrypted_pw
end

puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")
puts decrypt(encrypt("swordfish"))

=begin
p alpha[encrypted_pw[encrypted_pw[index]]]
	p alpha[encrypted_pw.index(encrypted_pw[index])]



index = secret_password.length - 1
#initiate loop that increments the index up to the length of the
#password so that the process is run on each character
while index > 0
	#For each index position of the string we reassigned the value to the next alphabetical order index value
  
  index -= 1
end

=end