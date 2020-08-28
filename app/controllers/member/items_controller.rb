class Member::ItemsController < ApplicationController

  def index
    @genres = Genre.where(is_active: true)
    # URLに:genre_idが存在するならif、しないならelse
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id])
    else
      # genres有効の商品のみ表示
      @items = Item.joins(:genre).where(genres: {is_active: "true"})
    end
  end

  def show
    @genres = Genre.where(is_active: "true")
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end