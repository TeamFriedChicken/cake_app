class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image
  validates :genre_id, :name, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :is_active, inclusion: {in: [true, false]}
end