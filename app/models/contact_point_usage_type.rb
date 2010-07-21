require 'cromby_ref_data'

class ContactPointUsageType < ActiveRecord::Base

  include CrombyRefData

  set_table_name "cin.contact_point_usage_types"

  belongs_to :data_status, :foreign_key => "data_status_code"
  
  @ref_data_table = RefDataTable.find_by_table_name("contact_point_usage_types")

end
