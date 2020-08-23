<<<<<<< HEAD
class Order < ApplicationRecord

  belongs_to :member

  has_many :order_details, dependent: :destroy
end
=======
class Order < ApplicationRecord

  belongs_to :member

  has_many :order_details, dependent: :destroy

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1, "代引き": 2 }

  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

  validates :name, :address, :postcode, presence: true
  validates :postcode, length: { is: 7 } , numericality: true

end
>>>>>>> member_orderdetails
