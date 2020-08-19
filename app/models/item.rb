class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  attachment :image

  # has_many :order_details, dependent: :destroy
end