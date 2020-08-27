class Member::HomeController < ApplicationController
  def top
    @items = Item.all
  end

  def about
  end
end
