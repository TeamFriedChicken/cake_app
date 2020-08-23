<<<<<<< HEAD
class OrderDetail < ApplicationRecord
end
=======
class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
end
>>>>>>> member_orderdetails
