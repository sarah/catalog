require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe EntriesController do
  integrate_views
  before(:each) do
    controller.stub!(:current_user).and_return(activated_admin)
  end
  context "GET /entries/pending" do
    before(:each) do
      @pending_entries = [Factory(:entry)]
      Entry.stub!(:pending).and_return @pending_entries
    end
    it "is successful" do
      get :pending
      response.should be_success
    end
    
    it "assigns the pending entries" do
      get :pending
      assigns[:pending_entries].should be(@pending_entries)
    end
  end
  
  context "GET /entries" do
    before(:each) do
      @categories = [Factory(:category)]
      Category.stub!(:all).and_return @categories
    end
    it "assigns categories" do
      get :index
      assigns[:categories].should be(@categories)
    end
      
    
  end
  
  context "PUT /entries/:id/publish" do
    before(:each) do
      @entry = Factory(:entry)
    end
    it "publishes the entry" do
      put :publish, :id => @entry.id
      @entry.reload
      @entry.should be_published
    end
    it "redirects to pending entries" do
      put :publish, :id => @entry.id
      response.should redirect_to(pending_entries_path)
    end
  end
  
end