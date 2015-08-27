class ChangeOrdersToItemOrders < ActiveRecord::Migration
  def change
    rename_table :orders, :item_orders
  end
end
