class SessionsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    user = User.find_by_email(params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_back_or user
      flash[:success] = "Welcome, #{user.name}"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
    flash[:success] = "Bye bye"
  end

end
