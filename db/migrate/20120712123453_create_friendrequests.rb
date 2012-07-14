class CreateFriendrequests < ActiveRecord::Migration
  def change
    create_table :friendrequests do |t|
      t.integer :friend_id
      t.string :status
      t.references :user

      t.timestamps
    end
    add_index :friendrequests, :user_id
  end
end
