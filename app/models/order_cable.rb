class OrderCable < ApplicationRecord
  belongs_to :order_dispatcher
  belongs_to :user
end
