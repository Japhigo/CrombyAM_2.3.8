class CreateContactPointUsageTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_point_usage_types do |t|
      t.string :code
      t.string :display
      t.string :description
      t.boolean :available
      t.string :created_by
      t.timestamp :created_date_time
      t.string :updated_by
      t.timestamp :updated_date_time
      t.integer :data_status_code

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_point_usage_types
  end
end
