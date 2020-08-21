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
    @order.payment_method = params[:order][:payment_method]
    @add = params[:order][:add].to_i

    case @add
      when 1 # あなたの住所
        @order.postcode = @member.post_code
        @order.address = @customer.address
        @order.name = @member.first_name + @member.last_name
      when 2 # 登録住所
        @sta = params[:order][:address].to_i
        @address = Address.find(@sta)
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      when 3 # 新しいお届け先
        @order.postcode = params[:order][:new_add][:postcode]
        @order.address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end

  private

  def set_member
    @member = current_member
  end

  def order_params
    params.require(:order).permit(
      :created_at,
      :member_id,
      :postage,
      :name,
      :address,
      :postcode,
      :payment_method,
      :status,
      :total_price
    )
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
