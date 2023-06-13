class Avatar < ApplicationRecord
  has_many :user_avatars
  has_many :profiles, through: :user_avatars
end
