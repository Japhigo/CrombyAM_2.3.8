class HomeController < ApplicationController

  def login
    if request.post?
      user = ViewUser.authenticate(params[:user_name], params[:password])
      if user
        reset_session
        if user.days_until_password_expiry < 0
          @days_til_expiry = user.days_until_password_expiry
          flash.now[:notice] = "Password has expired, please update"
        else
          session[:user_id] = user.id
          redirect_to(:action => "index")
        end
      else
        flash.now[:notice] = "Invalid logon"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:notice] = "Logged out"
    redirect_to logout_path
  end

  def index
  end

end
