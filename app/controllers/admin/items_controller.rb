class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
  	redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
    @price = Item.all.sum(:price)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item)
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :genre_id, :is_active)
  end
end