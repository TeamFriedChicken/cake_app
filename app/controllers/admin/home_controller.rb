class Admin::HomeController < ApplicationController
  def top
    @today_order = Order.where(created_at: Time.zone.now.all_day)
  end
end