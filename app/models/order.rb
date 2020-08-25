class Order < ApplicationRecord
  belongs_to :member
  has_many :order_details, dependent: :destroy

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1, "代引き": 2 }

  validates :name, :address, :postcode, presence: true
  validates :postcode, length: { is: 7 } , numericality: true
end