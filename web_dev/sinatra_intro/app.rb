
# require gems
require 'sinatra'
require "sinatra/reloader" if development?
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do  # this can be tested in browser using this as the url: http://localhost:4567/?name=Thomas&age=120
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do # http://localhost:4567/about/Jimmy
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

# A /contact route that displays an address (you can make up the address).
get '/contact/:person/address/:address' do # http://localhost:4567/contact/Mike/address/2%20Timbuck%20Two%20Ave%20Mars%2094110
  person = params[:person]
  address = params[:address]
  "#{person} lives at #{address}"
end

# A /great_job route that can take a person's name as a query parameter (not a route parameter) and say "Good job, [person's name]!". If the query parameter is not present, the route simply says "Good job!"
get '/great_job/' do # http://localhost:4567/great_job/?name=Some%20Guy%20or%20Girl or http://localhost:4567/great_job/
  name = params[:name]
    if name == nil
      "Good job!"
    else
      "Good job, #{name}!"
    end
end

# A route that uses route parameters to add two numbers and respond with the result. The data types are tricky here -- when will the data need to be (or arrive as) a string?
get '/:digit_1/plus/:digit_2' do
  digit_1 = params[:digit_1]
  digit_2 = params[:digit_2]
  digit_1 = digit_1.to_i
  digit_2 = digit_2.to_i
  answer = digit_1 + digit_2
  "#{digit_1.to_s} + #{digit_2.to_s} = #{answer.to_s}"
end

# experimenting with querying for name from the table but didn't get it working yet
# get '/great_job/:name' do
#   student = db.execute("SELECT * FROM students WHERE name=?", [params[:name]])
#   unless student = nil
#     "Good job, #{student}!"
#   else
#     "Good job!"
#   end
# end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Is Sinatra the only web app library in Ruby? What are some others?
# "Sinatra is a free and open source software web application library and domain-specific language[2] written in Ruby. It is an alternative to other Ruby web application frameworks such as Ruby on Rails, Merb, Nitro, and Camping. It is dependent on the Rack web server interface." wikipedia

# Are SQLite and the sqlite3 gem your only options for using a database with Sinatra? What are some others?


# What is meant by the term web stack?
