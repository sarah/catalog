# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def category_header(cname)
    img_name = cname.gsub(/\s+/, '_').downcase.gsub(/\.+/, "")
    image_tag "labels/#{img_name}.png", :title => cname
  end
end
