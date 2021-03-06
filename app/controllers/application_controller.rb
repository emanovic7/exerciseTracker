class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :current_user
  before_action :require_logged_in, except: [:new, :create, :home]
  helper_method :current_user, :current_workout

  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_workout
    @current_workout = current_user.workouts.find(session[:workout_id]) if session[:workout_id]
  end

end
