module OrdersHelper
  def find_order
    @user = current_user
    @orders = @user.orders
    @order = Order.find_by_id(params[:id])
    @last_order = @user.orders.last
  end

  def select_items
    @items1 = Item.where(category: 'First course', a_day_of_week: Date.today)
    @items2 = Item.where(category: 'Main course', a_day_of_week: Date.today)
    @items3 = Item.where(category: 'Drink', a_day_of_week: Date.today)
  end

  def admin_or_correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_path) unless current_user.admin? || current_user?(@user)
  end

  def find_items_for_show_action
    @item1=Item.find(@order.first_course)
    @item2=Item.find(@order.main_course)
    @item3=Item.find(@order.drink)
    @items=[@item1,@item2,@item3]
    @sum=@items.inject(0) {|sum, item| sum + item.price }
  end
end
