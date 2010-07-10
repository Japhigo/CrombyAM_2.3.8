class CreateRefDataTables < ActiveRecord::Migration
  def self.up
    create_table :ref_data_tables do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :ref_data_tables
  end
end
