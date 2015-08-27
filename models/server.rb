class Server < ActiveRecord::Base
  has_many :parties
  has_many :item_orders
end
