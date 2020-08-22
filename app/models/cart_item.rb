class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :member

  def total_price
		item.price*quantity
	end
end
