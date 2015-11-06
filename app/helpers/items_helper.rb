module ItemsHelper
  def find_item
    @item = Item.find(params[:id])
  end

  def find_all_items
    @first_items = Item.where(a_day_of_week: @weekday, category: "First course" ).order("created_at DESC")
    @main_items = Item.where(a_day_of_week: @weekday, category: "Main course" ).order("created_at DESC")
    @drink_items = Item.where(a_day_of_week: @weekday, category: "Drink" ).order("created_at DESC")
    @all_items = [@first_items, @main_items, @drink_items]
  end

  def find_all_items_for_admin
    @first_items = Item.where(category: "First course" ).order("created_at DESC")
    @main_items = Item.where(category: "Main course" ).order("created_at DESC")
    @drink_items = Item.where(category: "Drink" ).order("created_at DESC")
    @all_items = [@first_items, @main_items, @drink_items]
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def created
    params[:created_at] = params[:created_at].strftime('%A')
  end


end
