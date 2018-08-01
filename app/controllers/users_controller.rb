class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
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
      @user.require(:user_name).permit(
      :first_name,
      :last_name,
      :email,
      :password)
    end


end
