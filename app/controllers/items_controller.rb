class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :edit, :destroy]
  before_filter :signed_in_user

  def index
    if params[:weekday].blank? && current_user.admin?
      find_all_items_for_admin
      @orders = Order.all.order("created_at DESC")
    elsif current_user && params[:weekday].blank?
      @weekday = Date.today
      find_all_items
    else
      @weekday = params[:weekday]
      find_all_items
      @orders = Order.where(a_day_of_week: @weekday).order("created_at DESC")

    end
  end


  def new
    @item = Item.new
  end

  def show

  end

  def create
    @item = Item.new(params_of_item)
    if @item.save
      redirect_to @item
      flash[:success] = "Item created successfully"
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(params_of_item)
      redirect_to @item
      flash[:success] = "Item updated successfully"
    else
      render 'edit'
    end
  end

  def edit

  end

  def destroy
    if @item.destroy
      redirect_to items_path
      flash[:success] = "Item was successfully deleted"
    end
  end


  private

    def params_of_item
      params.require(:item).permit(:name, :price, :description, :category, :a_day_of_week)
    end

end





