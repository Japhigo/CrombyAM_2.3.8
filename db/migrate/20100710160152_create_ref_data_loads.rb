class CreateRefDataLoads < ActiveRecord::Migration
  def self.up
    create_table :ref_data_loads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :ref_data_loads
  end
end
