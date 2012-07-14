class CreateFriendAddedLists < ActiveRecord::Migration
  def change
    create_table :friend_added_lists do |t|
      t.integer :friend_id
      t.references :user

      t.timestamps
    end
    add_index :friend_added_lists, :user_id
  end
end
