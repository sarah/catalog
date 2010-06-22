require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Entry do

  it "should have a valid factory" do
    Factory.build(:entry).should be_valid
  end

  it "should be invalid w/o [:user, :title, :body, :cate gory_id]" do
    [:user, :title, :body, :category].each do |attr|
      Factory.build(:entry, attr => nil).should_not be_valid
    end
  end
  
  it "should have a named to_param stub" do
    e = Factory(:entry)
    e.to_param.should == "#{e.id}-#{e.title.gsub(/[^a-z0-9]+/i, '-')}"
  end

  it "should default to pending" do 
    u = activated_user
    e = Factory(:entry, :user => u)
    e.should be_pending
  end

  it "returns pending entries" do

    pending_entry = Factory(:entry)
    not_pending_entry = Factory(:entry)
    not_pending_entry.publish!
    
    Entry.pending.should_not include(not_pending_entry)
    Entry.pending.should include(pending_entry)
  end
  
  it "returns published entries" do
    pending_entry = Factory(:entry)
    not_pending_entry = Factory(:entry)
    not_pending_entry.publish!
    
    Entry.published.should include(not_pending_entry)
    Entry.published.should_not include(pending_entry)
  end
  

end