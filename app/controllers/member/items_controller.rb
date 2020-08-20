class Member::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
