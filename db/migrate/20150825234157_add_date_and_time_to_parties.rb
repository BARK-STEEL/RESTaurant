class AddDateAndTimeToParties < ActiveRecord::Migration
  def change
    add_column :parties, :reservation_date, :date
    add_column :parties, :reservation_time, :string
  end
end
