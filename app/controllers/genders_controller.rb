class GendersController < ApplicationController
  
  before_filter :find_gender, :only => [:show, :edit, :update, :redundant]

  # GET /genders
  # GET /genders.xml
  def index
    @genders = Gender.all(:include => :data_status, :order => "code, display, description")
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genders }
    end
  end

  # GET /genders/1
  # GET /genders/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gender }
    end
  end

  # GET /genders/new
  # GET /genders/new.xml
  def new
    @gender = Gender.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gender }
    end
  end

  # GET /genders/1/edit
  def edit
  end

  # POST /genders
  # POST /genders.xml
  def create
    @gender = Gender.new(params[:gender])

    @gender.create_audit_data
    
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

  # PUT /genders/1
  # PUT /genders/1.xml
  def update

    @gender.update_audit_data
    
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

    @gender.make_redundant

    respond_to do |format|
      if @gender.update_attributes(params[:gender])
        flash[:notice] = 'Gender was successfully made redundant.'
        format.html { redirect_to(genders_url) }
        format.xml  { head :ok }
      end
    end
  end
  
private

  def find_gender
    @gender = Gender.find(params[:id])
  end
end
