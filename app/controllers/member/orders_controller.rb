class Member::OrdersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_member.cart_items
  end

  def create
    current_member.cart_items.exists?
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    current_member.cart_items.each do |cart_item|
      order_item = @order.order_items.build
      order_item.order_id = @order.id
      order_item.product_id = cart_item.product_id
      order_item.quantity = cart_item.quantity
      order_item.order_price = cart_item.product.price
      order_item.save
      cart_item.destroy #order_itemに情報を移したらcart_itemは消去
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def set_member
    @member = current_member
  end

  def order_params
    params.require(:order).permit(
      :created_at, :member_id, :postage, :status,
      order_details_attributes: [:item_id, :order_id, :quantity, :purchase]
      )
  end
end