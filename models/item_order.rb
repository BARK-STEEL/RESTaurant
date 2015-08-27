class ItemOrder < ActiveRecord::Base
  belongs_to :food
  belongs_to :party
  belongs_to :server

  enum status: {preparing: 0, delivered: 1 }
end
