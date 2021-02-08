class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_followable
  acts_as_follower
  has_many :posts #, dependent: :destroy
  has_one_attached :avatar
  has_one_attached :cover
end
