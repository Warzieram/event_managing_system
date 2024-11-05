# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Attendance.destroy_all
Event.destroy_all
User.destroy_all


User.create(email: "koikapettimei-8001@yopmail.com", encrypted_password: "tchiiiim", description: "fkkjsdflesufhsefuh", first_name: "Jacques", last_name: "Dupuis")
User.create(email: "participant@yopmail.com", encrypted_password: "tchiiiim", description: "fkkjsdflesufhsefuh", first_name: "Paul", last_name: "Dupuis")
Event.create(start_date: "09/12/2024", duration: 50, title: "Concert de Patrick Sebastien", price: 150, location: "Paris", administrated_event_id: @User.first.id)

Attendance.create(stripe_customer_id: 0, user_id: User.first.id+1, event_id: Event.first.id)
