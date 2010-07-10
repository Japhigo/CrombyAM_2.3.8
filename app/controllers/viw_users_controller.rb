class ViwUsersController < ApplicationController

  # GET /viw_users/1/edit
  def edit
    @viw_user = ViwUser.find(params[:id])
  end
  
  # PUT /viw_users/1
  # PUT /viw_users/1.xml
  def update
    @viw_user = ViwUser.find(params[:id])

    respond_to do |format|
      if @viw_user.update_attributes(params[:viw_user])
        format.html { redirect_to(:controller => "home", :notice => 'Password reset') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @viw_user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
