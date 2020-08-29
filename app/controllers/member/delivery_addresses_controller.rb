class Member::DeliveryAddressesController < ApplicationController
  def index
    @member = current_member
    @delivery_addresses = @member.delivery_addresses
    @delivery_address = DeliveryAddress.new
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.member_id = current_member.id
    if @delivery_address.save
      flash[:success] = "登録に成功しました"
      redirect_to members_delivery_addresses_path
    else
      flash[:alert] = "正しい値を入力してください。"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(delivery_address_params)
      flash[:success] = "配送先を編集しました。"
      redirect_to members_delivery_addresses_path, notice: "You have updated book successfully."
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "正しい値を入力してください。"
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to members_delivery_addresses_path
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:member_id, :postcode, :address, :name)
  end
end
