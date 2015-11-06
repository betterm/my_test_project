class AddDayOfWeekToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :a_day_of_week, :string
  end
end
