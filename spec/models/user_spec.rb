require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe User do
  context "entries" do
    before do
      @user = activated_user
      @pending_entry = Factory.create(:entry, :author => @user)
      @published_entry = published_entry(:author => @user)
      
    end
    
    it "has a scope for a users pending entries" do
      @user.entries.size.should == 2
      @user.entries.pending.size.should == 1
      @user.entries.pending.should include(@pending_entry)
      @user.entries.published.size.should == 1
      @user.entries.published.should include(@published_entry)
    end
  end
end