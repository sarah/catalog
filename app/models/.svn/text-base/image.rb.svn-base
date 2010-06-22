class Image < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :path_prefix  => "public/uploads",
                 :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
  
end