class SessionsController < ApplicationController

  def index
    @items = Item.all
  end

  def sunday
    @items = Item.where(a_day_of_week: 'sunday')
  end

  def monday
    @items = Item.where(a_day_of_week: 'monday')
  end

  def tuesday
    @items = Item.where(a_day_of_week: 'tuesday')
  end

  def wednesday
    @items = Item.where(a_day_of_week: 'wednesday')
  end

  def thursday
    @items = Item.where(a_day_of_week: 'thursday')
  end

  def friday
    @items = Item.where(a_day_of_week: 'friday')
  end

  def saturday
    @items = Item.where(a_day_of_week: 'saturday')
  end


  def create
    user = User.find_by_email(params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
