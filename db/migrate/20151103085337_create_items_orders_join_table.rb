class CreateItemsOrdersJoinTable < ActiveRecord::Migration
  def change
    create_table :items_orders, id: false do |t|
      t.integer :item_id
      t.integer :order_id
    end

    add_index :items_orders, :item_id
    add_index :items_orders, :order_id
  end
end
