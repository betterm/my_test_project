class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :edit, :destroy]

  def index
    @items = Item.all
     respond_to do |format|
       format.html
       format.json
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
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(params_of_item)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit

  end

  def destroy
    if @item.destroy
      redirect_to items_path
    end
  end


  private

    def params_of_item
      params.require(:item).permit(:name, :price, :description, :category, :a_day_of_week)
    end

    def find_item
      @item = Item.find(params[:id])
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end





