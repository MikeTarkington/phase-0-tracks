# require gems
require 'sinatra'
# required for development env on windows to persist server
require "sinatra/reloader" if development?
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# create_campuses_table_cmd = <<-SQL
#   CREATE TABLE IF NOT EXISTS campuses(
#     id INTEGER PRIMARY KEY,
#     campus VARCHAR(255)
#   )
# SQL

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# adding our own stuffs for 9.5
get '/template' do
  @students = db.execute("SELECT * FROM students")
  @campuses = db.execute("SELECT * FROM campuses")
  erb :template
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/template' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/template'
end

post '/template/campuses' do
  db.execute("INSERT INTO campuses (campus) VALUES (?)", [params['campus']])
  redirect '/template'
end

# add static resources
