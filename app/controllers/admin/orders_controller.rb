class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  private
  def order_params
    params.require(:order).permit(
      :created_at,
      :address,
      :name,
      :status,
      :payment_method,
      :postcode,
      :postage,
      :member_id,
      :total_price,
      order_details_attributes: [:order_id, :item_id, :quantity, :purchase, :status]
    )
  end
end
