class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|

      t.integer      :following_id
      t.integer      :follower_id
      t.timestamps null: false
    end
  end
end
