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
(1..100).each do |lv|
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
  break_time: 0,
  description: "Log in the app for the first time.",
  image_path: "achievements/1achievement.jpg",
  story: "Congratulations on your first visit! It's like stepping into a productivity
          wonderland where time flies faster than a rabbit on caffeine."
)
Achievement.create!(
  name: "The devil is in the details",
  studytime: 666,
  break_time: 0,
  description: "Study for 666 seconds.",
  image_path: "achievements/2achievement.jpg",
  story: "What do you call a sleeping dinosaur? A dino-snore!"
)
Achievement.create!(
  name: "Time after time",
  studytime: 3000,
  break_time: 0,
  description: "Study for 2 full classic sessions (25 minutes).",
  image_path: "achievements/3achievement.jpg",
  story: "It's like witnessing a unicorn learning to tap dance - both rare and impressively
          coordinated, leaving everyone wondering if time itself has been bewitched by your commitment!"
)
Achievement.create!(
  name: "Time Dominator",
  studytime: 6000,
  break_time: 0,
  description: "Study for 4 full classic sessions (25 minutes).",
  image_path: "achievements/4achievement.jpg",
  story: "What do you call a hippie's wife? Mississippi!"
)
Achievement.create!(
  name: "Push it to the limit!",
  studytime: 360_000,
  break_time: 0,
  description: "Study for 100 hours.",
  image_path: "achievements/5achievement.jpg",
  story: "Would you say you are motivated to succeed? No, but I'm terrified of failure"
)
Achievement.create!(
  name: "Time bender",
  studytime: 599_940,
  break_time: 0,
  description: "Study for 9999 minutes.",
  image_path: "achievements/6achievement.jpg",
  story: "I ordered a chicken and an egg online.
          I'll let you know what comes first."
)
Achievement.create!(
  name: "Break the record",
  description: "Take a break for a total of 5 minutes.",
  studytime: 0,
  break_time: 300,
  image_path: "achievements/7achievement.jpg",
  story: "What do lawyers wear to court? Lawsuits!"
)
Achievement.create!(
  name: "Take a five",
  studytime: 0,
  break_time: 1500,
  description: "Take a classic break (5 minutes) 5 times.",
  image_path: "achievements/8achievement.jpg",
  story: "What do you call a sad strawberry? A blueberry!"
)
Achievement.create!(
  name: "Breaks are important",
  studytime: 0,
  break_time: 6000,
  description: "Take a break for a total of 100 minutes.",
  image_path: "achievements/9achievement.jpg",
  story: "What kind of tea is hard to swallow? Reality!"
)
Achievement.create!(
  name: "Breaks are sooo important",
  studytime: 0,
  break_time: 60_000,
  description: "Take a break for a total of 1000 minutes.",
  image_path: "achievements/10achievement.jpg",
  story: "A man got 99 problems and probably about 94 of them from lack of motivation to do anything.
          Although break is important, remember to come back to focus"
)

puts "Achievements created!"
