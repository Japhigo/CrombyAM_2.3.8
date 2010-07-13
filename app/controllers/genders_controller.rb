require 'cromby_authorize'

class GendersController < ApplicationController
  
  before_filter :am_authorize

  before_filter :find_gender, :only => [:show, :edit, :update, :redundant]

  def index
    @genders = Gender.all(:include => :data_status, :order => "code, display, description")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genders }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gender }
    end
  end

  def new
    @gender = Gender.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gender }
    end
  end

  def edit
  end

  def create
    @gender = Gender.new(params[:gender])
    @gender.created_by = @current_user
    @gender.updated_by = @current_user

    respond_to do |format|
      if @gender.save
        flash[:notice] = 'Gender was successfully created.'
        format.html { redirect_to(@gender) }
        format.xml  { render :xml => @gender, :status => :created, :location => @gender }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gender.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @gender.updated_by = @current_user

    respond_to do |format|
      if @gender.update_attributes(params[:gender])
        flash[:notice] = 'Gender was successfully updated.'
        format.html { redirect_to(@gender) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gender.errors, :status => :unprocessable_entity }
      end
    end
  end

  def redundant
    @gender.redundant
    @gender.updated_by = @current_user

    respond_to do |format|
      if @gender.update_attributes(params[:gender])
        flash[:notice] = 'Gender was successfully made redundant.'
        format.html { redirect_to(genders_url) }
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

  def find_gender
    @gender = Gender.find(params[:id])
  end
  
end
