class Profile < ApplicationRecord
  belongs_to :user
  has_many :user_avatars
  has_many :avatars, through: :user_avatars
  has_many :sessions
  has_many :user_achievements
  has_many :achievements, through: :user_achievements
end
