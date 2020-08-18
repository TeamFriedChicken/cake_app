class Member::CartItemsController < ApplicationController

  before_action :authenticate_member!
  before_action :set_cart_item
  before_action :set_member

    # カート内商品一覧
  def index
    @cart_items = @member.cart_items.all
  end

  def create
    # ログイン会員の空のカート
    @cart_item = current_member.cart_items.build(cart_item_params)
    # 現在カートに入っている商品
    @current_item = CartItem.find_by(item_id: @cart_item.item_id,member_id: @cart_item.member_id)
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
      @current_item.quantity += params[:quantity].to_i
      # カート内商品を更新
      @current_item.update(cart_item_params)
      # カート内商品一覧画面へ遷移
      redirect_to members_cart_items_path
    end
  end

  def update
  end

  def destroy
  end

  def destroy_all
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
    params.permit(:item_id, :member_id, :quantity)
  end

end
