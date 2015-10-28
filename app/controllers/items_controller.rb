class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    if @item.update_attributes(item_params)
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

  private

    def item_params
      params.require(:item).permit(:name, :price, :description)
    end

    def find_item
      @item = Item.find(params[:id])
    end

  end
end
