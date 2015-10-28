class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :signed_in_user_redirect, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
  end

  def show

  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :pasword_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  def signed_in_user_redirect
    if signed_in?
      redirect_to root_path
    end
  end


end
