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
  end

  def index
  end

  def confirm_logout
    session[:user_uuid] = nil
    reset_session
    flash[:notice] = "You have logged out"
    redirect_to login_path
  end

end
