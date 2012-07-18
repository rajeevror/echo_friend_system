class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :photo
      t.references :user

      t.timestamps
    end
    add_index :shares, :photo_id
    add_index :shares, :user_id
  end
end
