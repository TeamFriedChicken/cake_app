class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :order_id, :item_id, :quantity, :purchase, presence: true
  
end
