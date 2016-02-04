class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string      :text
      t.text        :image
      t.integer     :user_friend
      t.string      :no_user_friend
      t.references  :user
      t.string      :date
      t.timestamps null: false
    end
  end
end
