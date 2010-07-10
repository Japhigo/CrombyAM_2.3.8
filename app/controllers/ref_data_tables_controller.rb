class RefDataTablesController < ApplicationController

  before_filter :am_authorize

  def index
    @ref_data_tables = RefDataTable.all(:order => "table_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_tables }
    end
  end

  def show
    @ref_data_table = RefDataTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  def edit
    @ref_data_table = RefDataTable.find(params[:id])
  end

  def update
    @ref_data_table = RefDataTable.find(params[:id])
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
    user_name = PgProc.authorize_user(session[:user_uuid], 'ref_data_admin')
    unless user_name[1]
      flash[:notice] = "You do not have the permissions to use this function"
      redirect_to(:controller => "home")
    end
    @current_user = user_name[1]
  end
end
