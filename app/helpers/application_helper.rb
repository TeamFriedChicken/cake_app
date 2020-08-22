module ApplicationHelper

  def tax_price(price)
    (price * 1.1).floor
  end
  
end
