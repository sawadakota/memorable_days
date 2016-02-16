class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memories
  has_many :comments

  has_many :following_to, class_name: Friendship, foreign_key: :following_id
  has_many :following, through: :following_to, source: :follower
  has_many :following_from, class_name: Friendship, foreign_key: :follower_id
  has_many :follower, through: :following_from, source: :following

  mount_uploader :avatar, ImageUploader

end
