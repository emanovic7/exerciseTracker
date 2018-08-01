class ApplicationController < ActionController::Base

  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      upload_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) << :image
  end


end
