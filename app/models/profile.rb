class Profile < ApplicationRecord
  belongs_to :user
  has_many :user_avatars
  has_many :avatars, through: :user_avatars
  has_many :sessions
  has_many :user_achievements
  has_many :achievements, through: :user_achievements
  belongs_to :level, optional: true

  before_validation :update_level

  def update_level
    # @level = Level.find_by("experience < :exp and max_experience > :exp", exp: experience)
    self.level = Level.find_by("experience < :exp and max_experience > :exp", exp: experience)
  end
end
