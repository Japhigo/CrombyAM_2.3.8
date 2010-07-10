class CreateViwUsers < ActiveRecord::Migration
  def self.up
    create_table :viw_users do |t|
      t.string :user_name
      t.string :user_uuid
      t.text :hashed_password
      t.text :salt
      t.integer :days_until_password_expiry

      t.timestamps
    end
  end

  def self.down
    drop_table :viw_users
  end
end
