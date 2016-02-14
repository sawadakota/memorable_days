class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text        :text
      t.references  :memory
      t.references  :user
      t.timestamps null: false
    end
  end
end
