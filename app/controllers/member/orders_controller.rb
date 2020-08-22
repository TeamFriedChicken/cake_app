class Member::OrdersController < ApplicationController
  before_action :authenticate_member!
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
      when 0 # あなたの住所
        @order.postcode = @member.postcode
        @order.address = @member.address
        @order.name = @member.first_name + @member.last_name
      when 1 # 登録住所
        @sta = params[:order][:address].to_i
        @address = DeliveryAddress.find(@sta)
        @order.postcode = @address.postcode
        @order.address = @address.address
        @order.name = @address.name
      when 2 # 新しいお届け先
        @order.postcode = params[:order][:new_add][:postcode]
        @order.address = params[:order][:new_add][:address]
        @order.name = params[:order][:new_add][:name]
    end
  end

  def create
    if current_member.cart_items.exists?
      @order = Order.new(order_params)
      @order.member_id = current_member.id
      @order.save

      # addressで住所モデル検索、該当データなければ新規作成
      if DeliveryAddress.find_by(address: @order.address).nil?
        @address = DeliveryAddress.new
        @address.postcode = @order.postcode
        @address.address = @order.address
        @address.name = @order.name
        @address.member_id = current_member.id
        @address.save
      end

      # cart_itemsの内容をorder_detailsに新規登録
      current_member.cart_items.each do |cart_item|
        order_detail = @order.order_details.build
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.quantity = cart_item.quantity
        order_detail.purchase = cart_item.total_price
        order_detail.save
        cart_item.destroy #order_detailに情報を移したらcart_itemは消去
      end
      render :complete
    end
  end

  def index
    @orders = @member.orders
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
