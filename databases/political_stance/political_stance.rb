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
    question_id INT,
    answer_id INT,
    political_stance INT,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (answer_id) REFERENCES answers(id),
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
# db.execute("INSERT INTO quiz_results (result) VALUES ('liberal')") #=> 1
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate liberal')") #=>
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate')") #=> 1
# db.execute("INSERT INTO quiz_results (result) VALUES ('moderate conservative')") #=> 1
# db.execute("INSERT INTO quiz_results (result) VALUES ('conservative')") #=> 1
# db.execute("INSERT INTO quiz_results (result) VALUES ('far right conservative')") #=> 1


# add fake users(RAN IT ONCE)
# def create_user(db, name, email ,password)
#   db.execute("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [name, email, password])
# end
#
# 10.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, Faker::Internet.password, )
# end

# explore ORM by retrieving data
# users = db.execute("SELECT * FROM users")
# users.each do |user|
#  puts "#{user['name']} is #{user['email']}"
# end
