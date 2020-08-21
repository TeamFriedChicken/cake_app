class Order < ApplicationRecord

  belongs_to :member

  has_many :order_details, dependent: :destroy
end
