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
end
