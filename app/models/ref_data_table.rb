class RefDataTable < ActiveRecord::Base
  
  set_table_name "cin.ref_data_tables"

  has_many :ref_data_loads

  #attr_accessor :user_name

  before_update :set_audit_fields

protected

  def set_audit_fields
    self.updated_date_time = Time.now
  end

end
