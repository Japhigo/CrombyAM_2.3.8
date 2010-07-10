module CrombyAuthorize

  def CrombyAuthorize.authorize_user(user_uuid, user_role)
    user_name = PgProc.authorize_user(user_uuid, user_role)
    user_name[1]
  end
  
end
