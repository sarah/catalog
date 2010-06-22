class Category < ActiveRecord::Base
  # has_many :categories_entries, :class_name => "CategoryEntry", :dependent => :destroy
  # has_many :entries, :through => :categories_entries
  has_many :catalog_entries, :class_name => "Entry", :order => "created_at desc", :conditions => {:status => "published"} do
    def most_recent(limit=15)
       find(:all, :limit => limit)
     end
  end
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}"
  end
end