class HomeController < ApplicationController

  def login
    if request.post?
      user = ViwUser.authenticate(params[:user_name], params[:password])
      if user
        reset_session
        session[:user_uuid] = user.user_uuid
        if user.days_until_password_expiry < 0
          flash[:notice] = "Password has expired, please update"
          redirect_to edit_viw_user_path(user)
        else
          redirect_to(:action => "index")
        end
      else
        flash.now[:notice] = "Invalid logon"
      end
    end
  end

  def logout
    #flash[:notice] = "You are now logged out of Cromby, goodbye!"
    #session.delete
    #redirect_to login_path

  end

  def index
  end

end
