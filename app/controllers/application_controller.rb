# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :am_authenticate, :except => :login
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected

  def am_authenticate
    unless ViwUser.find_by_user_uuid(session[:user_uuid])
      flash[:notice] = "Please log in"
      redirect_to login_path
    end
  end
end
