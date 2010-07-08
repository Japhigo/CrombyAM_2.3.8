module CrombyAuthorize

  def authorize_user(user_uuid, user_role)
    user_name = PgProc.authorize_user(user_uuid, user_role)
    username[1]
  end
  
end
