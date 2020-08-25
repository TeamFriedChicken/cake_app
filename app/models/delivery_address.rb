<<<<<<< HEAD
class DeliveryAddress < ApplicationRecord
	belongs_to :member
end
=======
class DeliveryAddress < ApplicationRecord
	belongs_to :member

	validates :postcode, format: {with: /\A\d{7}\z/}
	validates :address, presence: true
	validates :name, presence: true

	def order_address
		"〒" +self.postcode + "　" + self.address + "　" + self.name
	end

end
>>>>>>> member_orderdetails
