require 'cromby_ref_data'

class Gender < ActiveRecord::Base

  include CrombyRefData
  
  set_table_name "cin.genders"
  
  belongs_to :data_status, :foreign_key => "data_status_code"
  
  @ref_data_table = RefDataTable.find_by_table_name("genders")

end
