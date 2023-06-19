class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :user_avatars
  has_many :avatars, through: :user_avatars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_profile
  def create_profile
    Profile.create!(user: self)
  end

  def level
    profile.level.level
  end

  # def level
  #   time_spent = self.profile.total_study_time

  #   for i in 0...100 do
  #     level = i
  #     break if time_spent < 1.25**i * 1500
  #   end

  #   case time_spent
  #   when 0...1500
  #     return 2
  #   when 1500...4500
  #     return 3
  #   when 4500...8100
  #     return 4
  #   when 8100...12_420
  #     return 5
  #   when 12_420...17_604
  #     return 6
  #   when 17_604...238_24
  #     return 7
  #   when 238_24...312_88
  #     return 8
  #   when 312_88...402_44
  #     return 9
  #   when 402_44...509_91
  #     return 10
  #   when 509_91...638_87
  #     return 11
  #   when 638_87...793_62
  #     return 12
  #   end
  # end
end
