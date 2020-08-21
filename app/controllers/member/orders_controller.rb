class Member::OrdersController < ApplicationController

  
  before_action :set_member

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_member.cart_items
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

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
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
  
end
