class Member::ItemsController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)

    if params[:genre].nil?
      @items = Item.page(params[:page]).per(8)
    else
      # genres有効の商品のみ表示
      @items = Item.joins(:genre).where(genres: {is_active: "true"})
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end