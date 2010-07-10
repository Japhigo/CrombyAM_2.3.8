class DataStatusesController < ApplicationController
  # GET /data_statuses
  # GET /data_statuses.xml
  def index
    @data_statuses = DataStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_statuses }
    end
  end

  # GET /data_statuses/1
  # GET /data_statuses/1.xml
  def show
    @data_status = DataStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_status }
    end
  end

  # PUT /data_statuses/1
  # PUT /data_statuses/1.xml
  #def update
  #  @data_status = DataStatus.find(params[:id])
  #
  #  respond_to do |format|
  #    if @data_status.update_attributes(params[:data_status])
  #      flash[:notice] = 'DataStatus was successfully updated.'
  #      format.html { redirect_to(@data_status) }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @data_status.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end
end
