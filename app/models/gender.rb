class Gender < ActiveRecord::Base

  set_table_name "cin.genders"
  
  belongs_to :data_status, :foreign_key => "data_status_code"
  
  @@ref_data_table = RefDataTable.find(:first, :conditions => "table_name = 'genders'")

  validates_presence_of :code, :if => :code_mandatory?
  validates_length_of :code, :maximum => 10, :if => :code?
  validates_uniqueness_of :code, :if => :code?
  validate :code_is_right_length
  validate :code_is_right_format


  validates_presence_of :display
  validates_length_of :display, :maximum => 30
  validates_uniqueness_of :display

  validates_presence_of :description, :if => :description_mandatory?


  def make_redundant
    self.available = false
    self.data_status_code = -1
    self.updated_date_time = Time.now
    self.updated_by = "joe_user"
  end

  def create_audit_data
    self.created_date_time = Time.now
    self.created_by = "joe_user"
    self.updated_date_time = Time.now
    self.updated_by = "joe_user"
  end

  def update_audit_data
    self.updated_date_time = Time.now
    self.updated_by = "joe_user"
  end

protected

  def code_is_right_length
    errors.add(:code, "Code must be between " << @@ref_data_table.code_min_length.to_s << " and " << @@ref_data_table.code_max_length.to_s ) if
      self.code.to_s.size < @@ref_data_table.code_min_length or self.code.to_s.size > @@ref_data_table.code_max_length
  end

  def code_is_right_format
    errors.add(:code, "Code must be in the right format: " << @@ref_data_table.code_format) if
    self.code !~ Regexp.new(@@ref_data_table.code_format)
  end
  
  def code_mandatory?
    return @@ref_data_table.code_mandatory
  end

  def display_mandatory?
    return @@ref_data_table.display_mandatory
  end

  def description_mandatory?
    return @@ref_data_table.description_mandatory
  end

  def ref_data_code_format
    return @@ref_data_table.code_format
  end

end
