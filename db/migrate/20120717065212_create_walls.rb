class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :post_wall
      t.references :user

      t.timestamps
    end
    add_index :walls, :user_id
  end
end
