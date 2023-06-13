class UserAvatar < ApplicationRecord
  belongs_to :profile
  belongs_to :avatar
end
