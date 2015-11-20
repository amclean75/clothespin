class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || profile_path
  end
  
  def after_update_path_for(resource)
	  profile_path(resource)
  end
  protected 
  
  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) << [:username, :bio, :gender]
      devise_parameter_sanitizer.for(:account_update) << :bio << :username << :avatar
  end
end


# before_filter :configure_permitted_parameters, if: :devise_controller?


