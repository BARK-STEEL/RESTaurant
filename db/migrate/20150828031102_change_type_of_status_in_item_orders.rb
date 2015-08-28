class ChangeTypeOfStatusInItemOrders < ActiveRecord::Migration
  def change
    change_column :item_orders, :status, :string
  end
end
