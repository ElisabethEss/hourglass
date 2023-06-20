class Avatar < ApplicationRecord
  has_one :profile, through: :user_avatar
end
