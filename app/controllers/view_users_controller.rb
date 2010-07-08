class ViewUsersController < ApplicationController
  # GET /view_users
  # GET /view_users.xml
  def index
    @view_users = ViewUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @view_users }
    end
  end

  # GET /view_users/1
  # GET /view_users/1.xml
  def show
    @view_user = ViewUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @view_user }
    end
  end

  # GET /view_users/new
  # GET /view_users/new.xml
  def new
    @view_user = ViewUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @view_user }
    end
  end

  # GET /view_users/1/edit
  def edit
    @view_user = ViewUser.find(params[:id])
  end

  # POST /view_users
  # POST /view_users.xml
  def create
    @view_user = ViewUser.new(params[:view_user])

    respond_to do |format|
      if @view_user.save
        format.html { redirect_to(@view_user, :notice => 'ViewUser was successfully created.') }
        format.xml  { render :xml => @view_user, :status => :created, :location => @view_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @view_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /view_users/1
  # PUT /view_users/1.xml
  def update
    @view_user = ViewUser.find(params[:id])

    respond_to do |format|
      if @view_user.update_attributes(params[:view_user])
        format.html { redirect_to(@view_user, :notice => 'ViewUser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @view_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /view_users/1
  # DELETE /view_users/1.xml
  def destroy
    @view_user = ViewUser.find(params[:id])
    @view_user.destroy

    respond_to do |format|
      format.html { redirect_to(view_users_url) }
      format.xml  { head :ok }
    end
  end
end
