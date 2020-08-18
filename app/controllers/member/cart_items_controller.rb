class Member::CartItemsController < ApplicationController

  def index
    @cart_items = current_member.cart_items
  end

  def create

    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    # flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
    redirect_to items_path

  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  private

  def cart_item_params
    params.permit(:quantity, :item_id)
  end

end
