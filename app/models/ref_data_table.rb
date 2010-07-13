class RefDataTable < ActiveRecord::Base
  
  set_table_name "cin.ref_data_tables"

  has_many :ref_data_loads

end
