class Food < ActiveRecord::Base
  has_many :item_orders
end
