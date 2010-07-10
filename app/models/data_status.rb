class DataStatus < ActiveRecord::Base
  set_table_name "cin.data_statuses"
  set_primary_key "code"

  has_many :genders, :foreign_key => "code"
end
