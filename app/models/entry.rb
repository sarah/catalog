class Entry < ActiveRecord::Base
  set_table_name "catalog_entries"
  
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  belongs_to :category
  validates_presence_of :author, :title, :body, :category
  has_many :images, :foreign_key => :catalog_entry_id
  
  # has_many :categories_entries, :class_name => "CategoryEntry", :dependent => :destroy, :foreign_key => :catalog_entry_id
  # has_many :categories, :through => :categories_entries

  # 
  # define_index do
  #   indexes title, body
  #   indexes author.login, :as => :author_login
  #   set_property :delta => true 
  # end
  
  [:pending, :published].each do |status|
    named_scope status, :conditions => {:status => status.to_s}, :order => "created_at desc"
  end
  
  acts_as_state_machine :column => :status, :initial => :pending
  
  state :pending
  state :published
    
  event :publish do
    transitions :from => :pending, :to => :published
  end
  
  # define_index do
  #   indexes title, body
  # end

  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
end
