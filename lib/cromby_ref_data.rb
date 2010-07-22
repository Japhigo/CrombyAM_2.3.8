module CrombyRefData

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods
  end

  module InstanceMethods

    def redundant
      self.available = false
      self.data_status_code = -1
    end
  end
  
end
