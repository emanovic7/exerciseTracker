class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :current_user
  before_action :require_logged_in, except: [:new, :create, :home]
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to root_path unless logged_in?
  end


end
