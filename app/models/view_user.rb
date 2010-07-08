require 'digest/sha2'
require 'cromby_authenticate'

class ViewUser < ActiveRecord::Base

  validates_presence_of :user_name

  #validate :password_non_blank

  def self.authenticate(user_name, password)
    user = self.find_by_user_name(user_name)
    #if user
    #  if CrombyAuthenticate::password_valid?(password, user.hashed_password, user.salt)
    #    user
    #  else
    #    user = nil
    #  end
    #end
  end

  def password
    @password
  end

private

  #def password_non_blank
   # errors.add(:password, "Missing password") if hashed_password.blank?
  #end


end
