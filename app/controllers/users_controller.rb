class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, only: [:edit,:show, :index, :update, :destroy]
  before_filter :correct_user_or_admin,   only: [:show]
  before_filter :admin_user,     only: [:destroy, :index]
  before_filter :signed_in_user_redirect, only: [:new, :create]
  before_action :only_correct_user, only: [:edit, :update]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    sign_in @user
    flash[:success] = "Welcome to Lunches App!"
    redirect_to root_path
      else
        render 'new'
      end
  end

  def show
    @orders = Order.where(user_id: params[:user_id])
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User destroyed."
      redirect_to root_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
