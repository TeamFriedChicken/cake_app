<<<<<<< HEAD
class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  attachment :image

  # has_many :order_details, dependent: :destroy

  
=======
class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image
  validates :genre_id, :name, presence: true
<<<<<<< HEAD
  
>>>>>>> member_orderdetails
=======
>>>>>>> admin_order
end