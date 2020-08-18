class ApplicationController < ActionController::Base

  private
  
  def current_cart_item
    # セッションから取得したcart_item_idを元にCart_itemsテーブルからCart_item情報を取得
    current_cart_item = CartItem.find_by(id: session[:cart_item_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart_item = CartItem.create unless current_cart_items
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_item_id] = current_cart_item.id
    # Cart情報を返却
    current_cart_item
  end
end
