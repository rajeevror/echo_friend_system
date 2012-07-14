class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email_id
      t.string :password
      t.integer :mobile
      t.string :country
      t.string :state
      t.string :city
      t.binary :images

      t.timestamps
    end
  end
end
