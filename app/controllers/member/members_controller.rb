class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  def show
    @member = Member.find(current_member.id)
  end

  def edit
    @member = Member.find(current_member.id)
  end

  def update
    @member = Member.find(current_member.id)
    if @member.update(member_params)
      redirect_to members_path
      flash[:notice_update] = "会員情報が更新されました"
    else
      render "edit"
    end
  end

  def resignation
    @member = Member.find(current_member.id)
  end

  def quit
    @member = Member.find(member_params)
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @member.update(is_deleted: true)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postcode, :address, :phone_number, :email, :is_delete)
  end
end
