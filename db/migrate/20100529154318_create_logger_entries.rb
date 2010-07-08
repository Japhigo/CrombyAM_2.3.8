class CreateLoggerEntries < ActiveRecord::Migration
  def self.up
    create_table :logger_entries do |t|
      t.timestamp :log_date
      t.string :logger
      t.string :priority
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :logger_entries
  end
end
