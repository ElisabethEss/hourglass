# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Profile.destroy_all
User.destroy_all
Achievement.destroy_all

user = User.create!(
  email: "user@user.com",
  password: "user@user.com",
  name: "testuser"
)

puts "User created"

user.profile.update!(
  total_study_time: 3300,
  total_break_time: 200,
  experience: 1000
)

puts "User's profile created"

Achievement.create!(
  name: "My first time",
  studytime: 0,
  description: "Log in the app for the first time."
)
Achievement.create!(
  name: "The devil is in the details",
  studytime: 666,
  description: "Study for 666 seconds."
)
Achievement.create!(
  name: "Time after time",
  studytime: 3000,
  description: "Study for 2 full classic sessions (25 minutes)."
)
Achievement.create!(
  name: "Time Dominator",
  studytime: 6000,
  description: "Study for 4 full classic sessions (25 minutes)."
)
Achievement.create!(
  name: "Push it to the limit",
  studytime: 360_000,
  description: "Study for 100 hours."
)
Achievement.create!(
  name: "Time bender",
  studytime: 599_940,
  description: "Study for 9999 minutes."
)
Achievement.create!(
  name: "Break the record",
  studytime: 300,
  description: "Take a break for a total of 5 minutes."
)
Achievement.create!(
  name: "Take a five",
  studytime: 1500,
  description: "Take a classic break (5 minutes) 5 times."
)
Achievement.create!(
  name: "Breaks are important",
  studytime: 1500,
  description: "Take a break for a total of 100 minutes."
)
Achievement.create!(
  name: "Breaks are SOOOOO important",
  studytime: 15_000,
  description: "Take a break for a total of 1000 minutes."
)

puts "Achievements created!"
