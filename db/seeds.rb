# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Profile.destroy_all
User.destroy_all
user = User.create!(
  email: "user@user.com",
  password: "user@user.com",
  name: "testuser"
)
puts "User created"
user.create_profile!(
  total_study_time: 3300,
  total_break_time: 200,
  experience: 1000
)

Achievement.create!(
  name: "You suck!",
  studytime: 60,
  description: "You suck I hate U!!!"
)

Achievement.create!(
  name: "You still suck!",
  studytime: 3400,
  description: "You suck I hate U!!!"
)
