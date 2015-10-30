class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy ]
  before_action :select_items, only: [:new, :edit]
  before_action :admin_or_correct_user

  def index
    @orders = Order.where(user_id: params[:user_id])

  end

  def new
    @order = Order.new
  end

  def show


  end

  def create
    @user = current_user
    @order = @user.orders.build(order_params)
    if @order.save
    flash[:sucsess] = 'Order created'
    redirect_to user_orders_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:sucsess] = 'Order was sucsessfuly edit'
      redirect_to user_orders_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    @user_orders = @user.orders.find_by_id(params[:id])

    if @user_orders.destroy
      redirect_to user_orders_path
    else
      redirect_to user_order_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:id, :user_id, :first_course, :main_course, :drink)
  end

  def find_order
    @user = current_user
    @orders = @user.orders
    @order = Order.find_by_id(params[:id])
    @last_order = @user.orders.last
  end

  def select_items
    @items1 = Item.where(category: 'First course')
    @items2 = Item.where(category: 'Main course')
    @items3 = Item.where(category: 'Drink')
  end

  def admin_or_correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_path) unless current_user.admin? || current_user?(@user)
  end

end
