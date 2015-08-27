class AddServerIdToParties < ActiveRecord::Migration
  def change
    add_column :parties, :server_id, :integer
  end
end
