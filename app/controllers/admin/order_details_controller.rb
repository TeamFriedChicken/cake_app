class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    order_details = order_detail.order.order_details.pluck(:status)
    if order_detail.status == 2
      order_detail.order.update(status: 2)
    elsif order_details.all?{|status| status == 3}
      order_detail.order.update(status: 3)
    end
    redirect_to admin_order_path(order_detail.order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:status)
  end
end