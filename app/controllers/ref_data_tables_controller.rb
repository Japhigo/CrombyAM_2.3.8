require 'cromby_authorize'

class RefDataTablesController < ApplicationController

  before_filter :am_authorize

  before_filter :find_ref_data_table, :only => [:show, :edit, :update]

  def index
    @ref_data_tables = RefDataTable.all(:order => "table_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_tables }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  def edit
  end

  def update
    @ref_data_table.updated_by = @current_user
    
    respond_to do |format|
      if @ref_data_table.update_attributes(params[:ref_data_table])
        format.html { redirect_to(@ref_data_table, :notice => 'Reference Data Table was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ref_data_table.errors, :status => :unprocessable_entity }
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

  def find_ref_data_table
    @ref_data_table = RefDataTable.find(params[:id])
  end
end
