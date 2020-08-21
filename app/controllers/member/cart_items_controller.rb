class Member::CartItemsController < ApplicationController

  before_action :authenticate_member!
  before_action :set_cart_item, only: [:edit, :update, :destroy]
  before_action :set_member

    # カート内商品一覧
  def index
    @member = current_member
    @cart_items = @member.cart_items.all
  end

  def create
    # ログイン会員の空のカート作成
    @cart_item = current_member.cart_items.build(cart_item_params)
    # 現在カートに入っている商品
    @current_item = CartItem.find_by(item_id: @cart_item.item_id)
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    if @current_item.nil?
      if @cart_item.save
        flash[:success] = 'カートに商品が追加されました！'
        redirect_to members_cart_items_path
      else
        # ログイン会員のカート内の全商品
        @cart_items = @member.cart_items.all
        render 'index'
        flash[:danger] = 'カートに商品を追加できませんでした。'
      end
      # カートが空じゃないとき
    else
      # paramsで取ってくると文字列になるので".to_i"が必要!
      @current_item.quantity += params[:cart_item][:quantity].to_i
      # カート内商品を更新
      @current_item.update(quantity: @current_item.quantity)
      # カート内商品一覧画面へ遷移
      redirect_to members_cart_items_path
    end
  end

  def update
    @current_item = CartItem.find_by(item_id: @cart_item.item_id)
    @current_item.quantity = params[:cart_item][:quantity]
    @cart_item.update(quantity: @current_item.quantity)
    redirect_to members_cart_items_path
  end

  def destroy
    @cart_item.destroy
    redirect_to members_cart_items_path
  end

  def destroy_all
    @cart_items = current_member.cart_items
    @cart_items.destroy_all
    redirect_to members_cart_items_path
  end

  private

  # ログインしている会員
  def set_member
    @member = current_member
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :quantity, :image)
  end

end
