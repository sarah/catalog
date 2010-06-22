# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class PermissionError < StandardError; end
  
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper_method :admin?, :current_user, :logged_in?
  
  rescue_from PermissionError, :with => :unauthorized
  def unauthorized; render :template => '/shared/unauthorized'; end

  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '01bf0eb7b6f4379e304c417339d16528'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  def admin_required
    raise PermissionError unless admin?
  end

  # def admin?
  #   logged_in? && current_user.admin?
  # end
end
