<<<<<<< HEAD
class DeliveryAddress < ApplicationRecord
	belongs_to :member
end
=======
class DeliveryAddress < ApplicationRecord
	belongs_to :member

	def order_address
		"〒" +self.postcode + "　" + self.address + "　" + self.name
	end
end
>>>>>>> member_orderdetails
