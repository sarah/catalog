class EntriesController < ApplicationController
  before_filter :login_required , :except => [:index, :show]
  before_filter :admin_required, :only => [:pending]

  def index
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  def pending
    @pending_entries = Entry.pending
  end

  def publish
    entry = Entry.find(params[:id])
    entry.publish!
    respond_to do |format|
      format.html{redirect_to pending_entries_path}
    end
  end

  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  def new
    @entry = Entry.new 

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end


  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { 
          if params[:entry_uploaded_data]
            @entry.images.create(:uploaded_data => params[:entry_uploaded_data])
          end
          redirect_to(@entry) 
          
          }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        flash[:notice] = 'Entry was successfully updated.'
        format.html { 
          if params[:entry_uploaded_data]
            @entry.images.create(:uploaded_data => params[:entry_uploaded_data])
          end
          redirect_to(@entry) 
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to(catalog_entries_url) }
      format.xml  { head :ok }
    end
  end
  
end
