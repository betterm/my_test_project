class AddCategoriesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :first_course, :string
    add_column :orders, :main_course, :string
    add_column :orders, :drink, :string
  end
end