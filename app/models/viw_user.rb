require 'cromby_authenticate'

class ViwUser < ActiveRecord::Base

  extend CrombyAuthenticate

  attr_accessor :old_password
  attr_accessor :new_password

  attr_accessor :new_password_confirmation
  validates_confirmation_of :new_password
  
  validate :password_supplied
  #validate :password_changed

  before_update :get_new_salt_and_hash

  def self.authenticate(user_name, password)
    user = self.find_by_user_name(user_name)
    if user
      if CrombyAuthenticate::password_valid?(password, user.hashed_password, user.salt)
        user
      else
        user = nil
      end
    end
  end

protected

  def get_new_salt_and_hash
    self.salt = CrombyAuthenticate::new_salt
    self.hashed_password = CrombyAuthenticate::encrypted_password(self.new_password, self.salt)
  end

  def password_supplied
    errors.add(:new_password, "New password must be supplied") if hashed_password.blank?
  end

  def password_changed
    errors.add(:new_password, "new password must be different") if old_password.eql?(new_password)
  end

end
