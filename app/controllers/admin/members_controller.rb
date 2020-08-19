class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to admin_member_path(member)
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postcode, :address, :phone_number, :emai, :is_delete)
  end
end
