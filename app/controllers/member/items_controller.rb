class Member::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre].nil?
      @items = Item.all
    else
      @items = Item.where(genre_id: params[genre])
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def genre_params
    params.require(:genre).permit(:name,:id)
  end
end
