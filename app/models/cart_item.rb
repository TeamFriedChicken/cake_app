class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :member

  
  #バリデーション---------------------------------------------------

  validates :member_id, :item_id, :quantity, presence: true

  # バリデーション---------------------------------------------------

  def total_price
		item.price*quantity
  end
end
