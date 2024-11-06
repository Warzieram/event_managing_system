# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all



# 10.times do |index|
# User.create(id: index+1, email: Faker::Internet.email, password:"fdkngsdlkfgjs", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
# end
# 
# 10.times do |index|
#   Event.create(id: index+1,duration: 5 , start_date: Faker::Date.forward(days: 1), title: Faker::Book.title, description: "fjqsnflqkesjfnsefnq", price: 50, location: Faker::Address.city, administrated_event_id: rand(1..10))
# end
# 
# 10.times do |index|
#   Attendance.create(id: index+1, stripe_customer_id: rand(1..10), user_id: rand(1..10), event_id: rand(1..10))
# end


