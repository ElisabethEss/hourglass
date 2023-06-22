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
Avatar.create(name: "avatar_1.jpg", level: 1, story: "In an enchanted forest village, the renowned chef Cedric possessed a magical talent. Donning white chef attire and a black apron, he infused his dishes with the essence of the forest. As he expertly carved an assortment of meats, wisps of enchanting smoke arose. Cedric's creations stirred profound emotions, leaving an indelible mark on all who tasted them. In his realm, culinary wonders became extraordinary experiences, forever cherished by those fortunate enough to indulge.")
Avatar.create(name: "avatar_2.jpg", level: 2, story: "In the vast expanse of a golden grassland, a formidable warrior stood tall, his beard blowing in the wind. Adorned in sturdy armor, he wore a trusty sword sheathed at his side. As the sun cast its warm glow, the warrior surveyed the breathtaking landscape before him, a grand canyon stretching into the horizon. His presence exuded strength and determination, embodying the spirit of an unwavering protector. Alone amidst nature's splendor, he stood ready to face any challenge that may come his way.")
Avatar.create(name: "avatar_3.jpg", level: 4, story: "Within the realm of royal lineage, the male prince donned a resplendent white suit adorned with intricate golden designs, symbolising his noble heritage. A black belt, elegantly embellished, cinched his waist while an ornate design draped gracefully over one shoulder, denoting his regal status. In his left hand, concealed from view, he wielded a sword with a hilt of obsidian and gilded accents, a testament to his valour and strength. With a destiny entwined in tales of honour and conquest he is prepared to face formidable adversaries and fulfill his noble legacy.")
Avatar.create(name: "avatar_4.jpg", level: 6, story: "Within the sun-dappled depths of the forest, a radiant fairy adorned with a blue dress stood in the glow of sunlight. Her short hair, an enchanting shade of blue, boasted delicate antlers, signifying her kinship with the woodland realm. In her grasp, she held a mysterious, elongated object resembling a sword or an arrow, its purpose veiled in secrecy. Two majestic male deer stood faithfully by her side, basking in the same ethereal sunlight that illuminated her fairy essence. Together, they embodied a harmonious union between the magical realm and the serene beauty of nature.")
Avatar.create(name: "avatar_5.jpg", level: 8, story: "Seated upon a magnificent golden throne, the king commanded attention with regal elegance. Draped in opulent attire, adorned with golden embellishments and a flowing red cape, he exuded majesty. In his hand, he held a gleaming cup, symbolizing his authority and prosperity. As his gaze extended beyond the throne room, glimpses of his prosperous kingdom unfolded, revealing ornate architecture and bustling streets. The king, a symbol of power and grandeur, ruled over a realm where opulence and grandeur intertwined, leaving a lasting impression on all who beheld his majestic presence.")
Avatar.create(name: "avatar_6.jpg", level: 10, story: "In the realm of divine beauty, a Greek goddess graced the scene with ethereal allure. Her upper body radiated enchantment, crowned with a golden headdress adorned with majestic wings on either side. With captivating elegance, she wore a regal armor upon her shoulders. Her dress, a testament to grace and opulence, showcased intricate golden embellishments alongside a pristine white fabric that flowed gracefully. Before her, a radiant luminosity illuminated the surroundings. As the epitome of celestial charm, she bewitched all who beheld her, embodying the timeless enchantment of a true goddess.")

puts "Avatars created"


user = User.create!(
  email: "user@user.com",
  password: "user@user.com",
  name: "testuser"
)

puts "User created"

user.profile.update!(
  total_study_time: 3300,
  total_break_time: 300,
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
  description: "Take a break for 1000 minutes.",
  image_path: "achievements/10achievement.jpg",
  story: "A man got 99 problems and probably about 94 of them from lack of motivation to do anything.
          Although break is important, remember to come back to focus"
)

puts "Achievements created!"
