# Write a Ruby program that uses persistent data to make your life better, or makes someone else's life better. Find several opportunities to try something not explicitly shown in the video. Can users create data? Retrieve it? Manipulate it? It's up to you. Push yourself, and decide with integrity when you are finished. Note that you do not need to use classes in this assignment -- keeping a class instance and a database row in sync is a lot of work, so that might be too much to tackle.

# schema diagram
# https://docs.google.com/presentation/d/1PpzbtXydD56KgzUwuDyzt226ymzvllYzzxMXnDMk_NI/edit?usp=sharing

# POLITICAL POSITION QUIZ

# required gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("political_stance.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_users_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    answer_id_1 INT,
    answer_id_2 INT,
    answer_id_3 INT,
    answer_id_4 INT,
    answer_id_5 INT,
    political_stance INT,
    FOREIGN KEY (answer_id_1) REFERENCES answers(id),
    FOREIGN KEY (answer_id_2) REFERENCES answers(id),
    FOREIGN KEY (answer_id_3) REFERENCES answers(id),
    FOREIGN KEY (answer_id_4) REFERENCES answers(id),
    FOREIGN KEY (answer_id_5) REFERENCES answers(id),
    FOREIGN KEY (political_stance) REFERENCES quiz_results(id)
  )
SQL

create_questions_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS questions(
    id INTEGER PRIMARY KEY,
    question VARCHAR(255)
  )
SQL

create_answers_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS answers(
    id INTEGER PRIMARY KEY,
    answer VARCHAR(255)
  )
SQL

create_quiz_results_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS quiz_results(
    id INTEGER PRIMARY KEY,
    result VARCHAR(255)
  )
SQL

# create a table (if it's not there already)
db.execute(create_users_table_cmd)
db.execute(create_questions_table_cmd)
db.execute(create_answers_table_cmd)
db.execute(create_quiz_results_table_cmd)

# add a test user
# db.execute("INSERT INTO users (name, email, password) VALUES ('Leeroy Jenkins', "lj@troll.com", "throwthegame")")

# create questions table data(RAN IT ONCE)
# db.execute("INSERT INTO questions (question) VALUES ('Global warming is a man-made problem.')") #=> id 1
# db.execute("INSERT INTO questions (question) VALUES ('Abortions should be legal under certain circumstances.')") #=> id 2
# db.execute("INSERT INTO questions (question) VALUES ('The most successful and wealtheist citizens of a nation are the primary driving force of national success.')")  #=> id 3
# db.execute("INSERT INTO questions (question) VALUES ('Government regulations interfere with freedom more than they help protect it.')")  #=> id 4
# db.execute("INSERT INTO questions (question) VALUES ('We need a large government in order to handle all the important tasks where the prosperity of the public is at stake.')")  #=> id 5

# create answers table data(RAN IT ONCE)
# db.execute("INSERT INTO answers (answer) VALUES ('Strongly Agree')") #=> 1
# db.execute("INSERT INTO answers (answer) VALUES ('Strongly Disagree')") #=> id 2
# db.execute("INSERT INTO answers (answer) VALUES ('Somewhat Agree')") #=> id 3
# db.execute("INSERT INTO answers (answer) VALUES ('Somewhat Disagree')") #=> id 4
# db.execute("INSERT INTO answers (answer) VALUES ('Unsure')") #=> id 5

# create quiz result political stances(RAN IT ONCE)
# db.execute("INSERT INTO quiz_results (result) VALUES ('far left liberal')") #=> 1
# db.execute("INSERT INTO quiz_results (result) VALUES ('liberal')") #=> 2
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate liberal')") #=> 3
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate')") #=> 4
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate conservative')") #=> 5
# db.execute("INSERT INTO quiz_results (result) VALUES ('conservative')") #=> 6
# db.execute("INSERT INTO quiz_results (result) VALUES ('far right conservative')") #=> 7


# add fake users(RAN IT ONCE)
# def create_user(db, name, email ,password)
#   db.execute("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [name, email, password])
# end
#
# 10.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, Faker::Internet.password, )
# end

# explore ORM by retrieving data - prints the names and emails included in the users table
# users = db.execute("SELECT * FROM users")
# users.each do |user|
#  puts "#{user['name']} is #{user['email']}"
# end

# adding a test user for query tests of foreign key table links
# db.execute("INSERT INTO users (name, email, password, answer_id_1, answer_id_2, answer_id_3, answer_id_4, answer_id_5, political_stance) VALUES ('testy von bigelsby', 'fake@email.com', 'fakepassword', 1, 2, 3, 4, 5, 4)")


# -- BUSINESS LOGIC

def stance_determinator(answer_1, answer_2, answer_3, answer_4, answer_5)
  left = 0
  right = 0
  political_stance = 0

  if answer_1 == 1
    left += 3
  elsif answer_1 == 2
    right += 3
  elsif answer_1 == 3
    left += 2
  elsif answer_1 == 4
    right += 2
  end

  if answer_2 == 1
    left += 3
  elsif answer_2 == 2
    right += 3
  elsif answer_2 == 3
    left += 2
  elsif answer_2 == 4
    right += 2
  end

  if answer_3 == 1
    right += 3
  elsif answer_3 == 2
    left += 3
  elsif answer_3 == 3
    right += 2
  elsif answer_3 == 4
    left += 2
  end

  if answer_4 == 1
    right += 3
  elsif answer_4 == 2
    left += 3
  elsif answer_4 == 3
    right += 2
  elsif answer_4 == 4
    left += 2
  end

  if answer_5 == 1
    left += 3
  elsif answer_5 == 2
    right += 3
  elsif answer_5 == 3
    left += 2
  elsif answer_5 == 4
    right += 2
  end

  puts "You have #{left} points toward liberalism and #{right} points toward conservatism."

  if left <= 1
    political_stance = 7
  elsif left >= 2 && left <= 4
    political_stance = 6
  elsif left >= 5 && left <= 6
    political_stance = 5
  elsif left >= 7 && left <= 8
    political_stance = 4
  elsif left >= 9 && left <= 10
    political_stance = 3
  elsif left >= 11 && left <= 13
    political_stance = 2
  elsif left >= 14 && left <= 15
    political_stance = 1
  end

end

def create_user(db, name, email, password, answer_1, answer_2, answer_3, answer_4, answer_5, political_stance)
  db.execute("INSERT INTO users (name, email, password, answer_id_1, answer_id_2, answer_id_3, answer_id_4, answer_id_5, political_stance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", name, email, password, answer_1, answer_2, answer_3, answer_4, answer_5, political_stance)
end

# --USER INTERFACE--

puts "Welcome to the mini political position assement app!"
puts " "
puts "Enter the basics to create your account and then answer a handful of quick questions to start getting a sense of your true political standing on a spectrum of liberalism to conservatism.  Obviously ones views and political opinions are too complex to be summed up in 5 simple questions, but it's a good start on our journey toward better citizenship and self understanding."
puts " "
puts "What is your name?"
name = gets.chomp

puts "What is your email address?"
email = gets.chomp

puts "What is your password?"
password = gets.chomp

puts "Answer the following questions by entering the number corresponding with your degree of agreement with each statement.  The options are as follows:"
puts "1 = Strongly Agree"
puts "2 = Strongly Disagree"
puts "3 = Somewhat Agree"
puts "4 = Somewhat Disagree"
puts "5 = Unsure"

questions = db.execute("SELECT * FROM questions")

puts "Question 1:"
puts questions[0][1]
puts "Your answer number:"
answer_1 = gets.chomp.to_i

puts "Question 2:"
puts questions[1][1]
puts "Your answer number:"
answer_2 = gets.chomp.to_i

puts "Question 3:"
puts questions[2][1]
puts "Your answer number:"
answer_3 = gets.chomp.to_i

puts "Question 4:"
puts questions[3][1]
puts "Your answer number:"
answer_4 = gets.chomp.to_i

puts "Question 5:"
puts questions[4][1]
puts "Your answer number:"
answer_5 = gets.chomp.to_i

p political_stance = stance_determinator(answer_1, answer_2, answer_3, answer_4, answer_5)
create_user(db, name, email, password, answer_1, answer_2, answer_3, answer_4, answer_5, political_stance)
