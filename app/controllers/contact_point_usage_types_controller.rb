require 'cromby_authorize'

class ContactPointUsageTypesController < ApplicationController

  before_filter :am_authorize

  before_filter :find_contact_point_usage_type, :only => [:show, :edit, :update, :redundant]

  def index
    @contact_point_usage_types = ContactPointUsageType.all(:include => :data_status, :order => "code, display, description")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_point_usage_types }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_point_usage_type }
    end
  end

  def new
    @contact_point_usage_type = ContactPointUsageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_point_usage_type }
    end
  end

  def edit
  end

  def create
    @contact_point_usage_type = ContactPointUsageType.new(params[:contact_point_usage_type])
    @contact_point_usage_type.created_by = @current_user
    @contact_point_usage_type.updated_by = @current_user

    respond_to do |format|
      if @contact_point_usage_type.save
        format.html { redirect_to(@contact_point_usage_type, :notice => 'Contact Point Usage Type was successfully created.') }
        format.xml  { render :xml => @contact_point_usage_type, :status => :created, :location => @contact_point_usage_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_point_usage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @contact_point_usage_type.updated_by = @current_user

    respond_to do |format|
      if @contact_point_usage_type.update_attributes(params[:contact_point_usage_type])
        format.html { redirect_to(@contact_point_usage_type, :notice => 'Contact Point Usage Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_point_usage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def redundant
    @contact_point_usage_type.redundant
    @contact_point_usage_type.updated_by = @current_user

    respond_to do |format|
      if @gender.update_attributes(params[:contact_point_usage_type])
        flash[:notice] = 'Contact Point Usage Type  was successfully made redundant.'
        format.html { redirect_to(contact_point_usage_types_url) }
        format.xml  { head :ok }
      end
    end
  end
  
protected

  def am_authorize
    user_name = CrombyAuthorize.authorize_user(session[:user_uuid], 'ref_data_admin')
    unless user_name
      flash[:notice] = "You do not have the permissions to use this function"
      redirect_to(:controller => "home")
    end
    @current_user = user_name
  end

private

  def find_contact_point_usage_type
    @contact_point_usage_type = ContactPointUsageType.find(params[:id])
  end
  
end
