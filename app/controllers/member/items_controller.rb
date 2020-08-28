class Member::ItemsController < ApplicationController

  def index
    @genres = Genre.where(is_active: true)
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
      @genre = Genre.find(params[:genre_id])
    else
      # genres有効の商品のみ表示
      @items = Item.joins(:genre).where(genres: {is_active: "true"}).page(params[:page]).per(8)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end