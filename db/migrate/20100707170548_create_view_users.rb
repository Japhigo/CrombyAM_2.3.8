class CreateViewUsers < ActiveRecord::Migration
  def self.up
    create_table :view_users do |t|
      t.string :user_name
      t.string :user_uuid
      t.string :salt
      t.integer :days_until_password_expiry

      t.timestamps
    end
  end

  def self.down
    drop_table :view_users
  end
end
