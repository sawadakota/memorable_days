class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memories
  has_many :following, class_name: "Friendship", foreign_key: :following_id
  mount_uploader :avatar, ImageUploader

  belongs_to :last_edited_user, class_name: "User", foreign_key: :last_edited_user_id
end
