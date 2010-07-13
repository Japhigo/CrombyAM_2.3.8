# This facility is not yet available as of Rails 2.3.8

class RefDataValidator < ActiveRecord::Validator
  def validate

    table_name = options[:class_name]
    @ref_data_table = RefDataTable.find(:first, :conditions => "table_name = '" + "#{table_name}"+ "'")

    record.errors[:base] << "Display is mandatory" if record.display.blank?

    if @ref_data_table.code_mandatory && record.code.blank?
      record.errors[:base] << "Code is mandatory"
    end

  end
end
