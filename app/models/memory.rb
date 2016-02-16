class Memory < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
end
