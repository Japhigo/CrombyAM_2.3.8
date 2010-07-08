class LoggerEntriesController < ApplicationController
  # GET /logger_entries
  # GET /logger_entries.xml
  def index
    @logger_entries = LoggerEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logger_entries }
    end
  end

  # GET /logger_entries/1
  # GET /logger_entries/1.xml
  def show
    @logger_entry = LoggerEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @logger_entry }
    end
  end

  # GET /logger_entries/new
  # GET /logger_entries/new.xml
  def new
    @logger_entry = LoggerEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @logger_entry }
    end
  end

  # GET /logger_entries/1/edit
  def edit
    @logger_entry = LoggerEntry.find(params[:id])
  end

  # POST /logger_entries
  # POST /logger_entries.xml
  def create
    @logger_entry = LoggerEntry.new(params[:logger_entry])

    respond_to do |format|
      if @logger_entry.save
        format.html { redirect_to(@logger_entry, :notice => 'LoggerEntry was successfully created.') }
        format.xml  { render :xml => @logger_entry, :status => :created, :location => @logger_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @logger_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /logger_entries/1
  # PUT /logger_entries/1.xml
  def update
    @logger_entry = LoggerEntry.find(params[:id])

    respond_to do |format|
      if @logger_entry.update_attributes(params[:logger_entry])
        format.html { redirect_to(@logger_entry, :notice => 'LoggerEntry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @logger_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /logger_entries/1
  # DELETE /logger_entries/1.xml
  def destroy
    @logger_entry = LoggerEntry.find(params[:id])
    @logger_entry.destroy

    respond_to do |format|
      format.html { redirect_to(logger_entries_url) }
      format.xml  { head :ok }
    end
  end
end
