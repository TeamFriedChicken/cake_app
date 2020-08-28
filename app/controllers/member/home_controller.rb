class Member::HomeController < ApplicationController
  def top
    # genreのis_activeが有効の商品から4件表示
    @items = Item.joins(:genre).where(genres: {is_active: "true"}).limit(4)
  end

  def about
  end
end