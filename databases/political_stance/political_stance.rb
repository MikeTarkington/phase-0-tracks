# Write a Ruby program that uses persistent data to make your life better, or makes someone else's life better. Find several opportunities to try something not explicitly shown in the video. Can users create data? Retrieve it? Manipulate it? It's up to you. Push yourself, and decide with integrity when you are finished. Note that you do not need to use classes in this assignment -- keeping a class instance and a database row in sync is a lot of work, so that might be too much to tackle.

# POLITICAL POSITION QUIZ

# required gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("political_stance.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
  )
SQL

# create a table (if it's not there already)
db.execute(create_table_cmd)

# add a test user
# db.execute("INSERT INTO users (name, email, password) VALUES ('Leeroy Jenkins', "lj@troll.com", "throwthegame")")

# add LOOOOTS of kittens!
# so. many. kittens.
#KittenExplosion
def create_user(db, name, email ,password)
  db.execute("INSERT INTO users (name, email, password) VALUES (?, ?, ?)", [name, email, password])
end

10.times do
  create_user(db, Faker::Name.name, Faker::Internet.email, Faker::Internet.password, )
end

# explore ORM by retrieving data
# users = db.execute("SELECT * FROM users")
# users.each do |user|
#  puts "#{user['name']} is #{user['email']}"
# end
