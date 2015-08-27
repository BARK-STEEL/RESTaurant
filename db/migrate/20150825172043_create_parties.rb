class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :table_number
      t.integer :number_seats
      t.string :status
      t.timestamps
    end
  end
end
