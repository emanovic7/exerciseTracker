class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :current_user

  def logged_in?
    !!current_user
  end


  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user_name).permit(
      :first_name,
      :last_name,
      :avatar,
      :email,
      :password)
    end

    alias_method :devise_current_user, :current_user
      def require_logged_in
        redirect_to root_path unless logged_in?
      end

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end


end
