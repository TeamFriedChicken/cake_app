class DeliveryAddress < ApplicationRecord
	belongs_to :member

	def order_address
		"〒" +self.postcode + "　" + self.address + "　" + self.name
	end

	validates :postcode, format: {with: /\A\d{7}\z/}
	validates :address, presence: true
	validates :name, presence: true

end
