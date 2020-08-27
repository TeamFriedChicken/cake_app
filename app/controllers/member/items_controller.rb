class Member::ItemsController < ApplicationController
  def index
    @genres = Genre.where(is_active: true)

    if params[:genre].nil?
      @items = Item.page(params[:page]).per(8)
    else
      @items = Item.where(genre_id: params[:genre]).page(params[:page]).per(8)
    end

  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  
end
