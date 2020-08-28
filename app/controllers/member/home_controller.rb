class Member::HomeController < ApplicationController
  def top
     @genres = Genre.where(is_active: true)
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id],is_active: true)
    else
      # genres有効の商品のみ表示
      @items = Item.joins(:genre).where(genres: {is_active: "true"})
    end
  end

  def about
  end
end