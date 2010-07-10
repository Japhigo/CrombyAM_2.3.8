class RefDataTablesController < ApplicationController
  # GET /ref_data_tables
  # GET /ref_data_tables.xml
  def index
    @ref_data_tables = RefDataTable.all(:order => "table_name")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ref_data_tables }
    end
  end

  # GET /ref_data_tables/1
  # GET /ref_data_tables/1.xml
  def show
    @ref_data_table = RefDataTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  # GET /ref_data_tables/new
  # GET /ref_data_tables/new.xml
  def new
    @ref_data_table = RefDataTable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ref_data_table }
    end
  end

  # GET /ref_data_tables/1/edit
  def edit
    @ref_data_table = RefDataTable.find(params[:id])
  end

  # POST /ref_data_tables
  # POST /ref_data_tables.xml
  def create
    @ref_data_table = RefDataTable.new(params[:ref_data_table])

    respond_to do |format|
      if @ref_data_table.save
        format.html { redirect_to(@ref_data_table, :notice => 'RefDataTable was successfully created.') }
        format.xml  { render :xml => @ref_data_table, :status => :created, :location => @ref_data_table }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ref_data_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ref_data_tables/1
  # PUT /ref_data_tables/1.xml
  def update
    @ref_data_table = RefDataTable.find(params[:id])

    respond_to do |format|
      if @ref_data_table.update_attributes(params[:ref_data_table])
        format.html { redirect_to(@ref_data_table, :notice => 'RefDataTable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ref_data_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ref_data_tables/1
  # DELETE /ref_data_tables/1.xml
  def destroy
    @ref_data_table = RefDataTable.find(params[:id])
    @ref_data_table.destroy

    respond_to do |format|
      format.html { redirect_to(ref_data_tables_url) }
      format.xml  { head :ok }
    end
  end
end
