class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy ]
  before_action :select_items, only: [:new, :edit]
  before_action :admin_or_correct_user
  before_action :find_items_for_show_action, only: [:show]

  def index
    @orders = Order.where(user_id: params[:user_id])
  end

  def new
    @order = Order.new
  end

  def show

  end

  def create
    @order = current_user.orders.create(order_params)
    if @order.save
    flash[:sucsess] = 'Order was successfully created'
    redirect_to user_orders_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:sucsess] = 'Order was sucsessfully updated'
      redirect_to user_orders_path
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find_by_id(params[:id])

    if @order.destroy
      redirect_to user_orders_path(params[:user_id])
      flash[:sucsess] = 'Order was sucsessfully deleted'
    else
      redirect_to user_order_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:id, :user_id, :first_course, :main_course, :drink, :a_day_of_week, :weekday, :date, :item_id)
  end

end
