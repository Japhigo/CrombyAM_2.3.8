module CrombyAuthenticate

  def CrombyAuthenticate.password_valid?(password, hashed_password, salt)
    self.encrypted_password(password, salt) == hashed_password
  end
  
  def CrombyAuthenticate.new_salt
    (1..512).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join
  end

  def CrombyAuthenticate.encrypted_password(password, salt)
    string_to_hash = "#{password}oojamaflip#{salt}"
    Digest::SHA512.hexdigest(string_to_hash)
  end

end
