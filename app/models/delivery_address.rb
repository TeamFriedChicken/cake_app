class DeliveryAddress < ApplicationRecord
	belongs_to :member

	validates :postcode, length: { is: 7 } , numericality: true
	validates :address, presence: true
	validates :name, presence: true

	def order_address
		"〒" +self.postcode + "　" + self.address + "　" + self.name
	end

end
