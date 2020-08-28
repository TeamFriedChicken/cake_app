class Member::HomeController < ApplicationController
  def top
    # genreのis_activeが有効の商品から4件表示
    @items = Item.joins(:genre).where(genres: {is_active: "true"}).limit(4)
    @genres = Genre.where(is_active: true)

  end

  def about
  end
end