class Entry < ActiveRecord::Base
  set_table_name "catalog_entries"
  
  belongs_to :user
  validates_presence_of :user, :title, :body
  has_many :images
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
  end
  # acts_as_state_machine
  # 
  # state :preview
  # state :published
  # event :publish do
  #   transitions :from => :preview, :to => :published
  # end
end
