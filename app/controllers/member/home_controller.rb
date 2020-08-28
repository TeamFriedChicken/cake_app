class Member::HomeController < ApplicationController
  def top
     @genres = Genre.where(is_active: true)
     @items = Item.joins(:genre).where(genres: {is_active: "true"}).limit(4)
    end
  end

  def about
  end
end