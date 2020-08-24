class Admin::HomeController < ApplicationController
  def top
<<<<<<< HEAD
  	@today_order = Order.where(created_at: Time.zone.now.all_day)
=======
    @today_order = Order.where(created_at: Time.zone.now.all_day)
>>>>>>> admin_order
  end


end