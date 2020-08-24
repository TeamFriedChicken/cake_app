<<<<<<< HEAD
class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :member

  def total_price
		item.price * quantity
	end
end
=======
class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member

  validates :member_id, :item_id, :quantity, presence: true

  def total_price
		item.price*quantity
  end
end
>>>>>>> member_orderdetails
