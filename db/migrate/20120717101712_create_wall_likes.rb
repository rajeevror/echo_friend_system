class CreateWallLikes < ActiveRecord::Migration
  def change
    create_table :wall_likes do |t|
      t.references :user
      t.references :wall

      t.timestamps
    end
    add_index :wall_likes, :user_id
    add_index :wall_likes, :wall_id
  end
end
