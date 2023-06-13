class Achievement < ApplicationRecord
  has_many :user_achievements
  has_many :profiles, through: :user_achievements
end
