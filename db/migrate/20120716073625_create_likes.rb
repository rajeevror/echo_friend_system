class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :photo
      t.references :user

      t.timestamps
    end
    add_index :likes, :photo_id
    add_index :likes, :user_id
  end
end
