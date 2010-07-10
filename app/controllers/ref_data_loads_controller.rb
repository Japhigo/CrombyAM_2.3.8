class RefDataLoadsController < ApplicationController
  # GET /ref_data_loads
  # GET /ref_data_loads.xml
  def index
    @ref_data_loads = RefDataLoad.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_loads }
    end
  end

  # GET /ref_data_loads/1
  # GET /ref_data_loads/1.xml
  def show
    @ref_data_load = RefDataLoad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_load }
    end
  end

  # GET /ref_data_loads/new
  # GET /ref_data_loads/new.xml
  def new
    @ref_data_load = RefDataLoad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ref_data_load }
    end
  end

  # GET /ref_data_loads/1/edit
  def edit
    @ref_data_load = RefDataLoad.find(params[:id])
  end

  # POST /ref_data_loads
  # POST /ref_data_loads.xml
  def create
    @ref_data_load = RefDataLoad.new(params[:ref_data_load])

    respond_to do |format|
      if @ref_data_load.save
        format.html { redirect_to(@ref_data_load, :notice => 'RefDataLoad was successfully created.') }
        format.xml  { render :xml => @ref_data_load, :status => :created, :location => @ref_data_load }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ref_data_load.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ref_data_loads/1
  # PUT /ref_data_loads/1.xml
  def update
    @ref_data_load = RefDataLoad.find(params[:id])

    respond_to do |format|
      if @ref_data_load.update_attributes(params[:ref_data_load])
        format.html { redirect_to(@ref_data_load, :notice => 'RefDataLoad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ref_data_load.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_data_loads/1
  # DELETE /ref_data_loads/1.xml
  def destroy
    @ref_data_load = RefDataLoad.find(params[:id])
    @ref_data_load.destroy

    respond_to do |format|
      format.html { redirect_to(ref_data_loads_url) }
      format.xml  { head :ok }
    end
  end
end
