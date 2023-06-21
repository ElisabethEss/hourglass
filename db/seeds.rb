# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
UserAvatar.destroy_all
Profile.destroy_all
User.destroy_all
Achievement.destroy_all
Level.destroy_all
Avatar.destroy_all


# create 10 levels
(1..10).each do |lv|
  min_experience = (1000 * (lv - 1) * 1.2) + 1
  max_exp = 1000 * lv * 1.2
  Level.create!(level: lv, experience: min_experience, max_experience: max_exp)
end

puts "Levels created"

# create 5 avatars
Avatar.create(name: "avatar_1.jpg", level: 1)
Avatar.create(name: "avatar_2.jpg", level: 2)
Avatar.create(name: "avatar_3.jpg", level: 4)
Avatar.create(name: "avatar_4.jpg", level: 6)
Avatar.create(name: "avatar_5.jpg", level: 8)
Avatar.create(name: "avatar_6.jpg", level: 10)

puts "Avatars created"


user = User.create!(
  email: "user@user.com",
  password: "user@user.com",
  name: "testuser"
)

puts "User created"

user.profile.update!(
  total_study_time: 3300,
  total_break_time: 200,
  experience: 3599
)

puts "User's profile created"

Achievement.create!(
  name: "My first time",
  studytime: 0,
  description: "Log in the app for the first time.",
  story: "Congratulations on your first visit! It's like stepping into a productivity
          wonderland where time flies faster than a rabbit on caffeine."
)
Achievement.create!(
  name: "The devil is in the details",
  studytime: 666,
  description: "Study for 666 seconds.",
  story: "What do you call a sleeping dinosaur? A dino-snore!"
)
Achievement.create!(
  name: "Time after time",
  studytime: 3000,
  description: "Study for 2 full classic sessions (25 minutes).",
  story: "It's like witnessing a unicorn learning to tap dance - both rare and impressively
          coordinated, leaving everyone wondering if time itself has been bewitched by your commitment!"
)
Achievement.create!(
  name: "Time Dominator",
  studytime: 6000,
  description: "Study for 4 full classic sessions (25 minutes).",
  story: "What do you call a hippie's wife? Mississippi!"
)
Achievement.create!(
  name: "Push it to the limit!",
  studytime: 360_000,
  description: "Study for 100 hours.",
  story: "Would you say you are motivated to succeed? No, but I'm terrified of failure"
)
Achievement.create!(
  name: "Time bender",
  studytime: 599_940,
  description: "Study for 9999 minutes.",
  story: "I ordered a chicken and an egg online.
          I'll let you know what comes first."
)
Achievement.create!(
  name: "Break the record",
  studytime: 300,
  description: "Take a break for a total of 5 minutes.",
  story: "What do lawyers wear to court? Lawsuits!"
)
Achievement.create!(
  name: "Take a five",
  studytime: 1500,
  description: "Take a classic break (5 minutes) 5 times.",
  story: "What do you call a sad strawberry? A blueberry!"
)
Achievement.create!(
  name: "Breaks are important",
  studytime: 1500,
  description: "Take a break for a total of 100 minutes.",
  story: "What kind of tea is hard to swallow? Reality!"
)
Achievement.create!(
  name: "Breaks are SOOOOO important",
  studytime: 15_000,
  description: "Take a break for a total of 1000 minutes.",
  story: "A man got 99 problems and probably about 94 of them from lack of motivation to do anything.
          Although break is important, remember to come back to focus"
)

puts "Achievements created!"
