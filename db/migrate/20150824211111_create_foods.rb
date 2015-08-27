class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :course
      t.string :allergens
      t.timestamps
    end
  end
end
