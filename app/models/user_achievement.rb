class UserAchievement < ApplicationRecord
  belongs_to :achievement
  belongs_to :profile
end
