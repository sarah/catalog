require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Category do
  context "entries" do
    it "has a scope of its 5 most recent entries" do
      category = Factory.create(:category)
      10.times do |i|
        Factory.create(:entry, :category => category)
      end
    
     category.catalog_entries.most_recent.size.should == 5
      
    end
  end
end