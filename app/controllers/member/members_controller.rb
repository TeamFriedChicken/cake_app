class Member::MembersController < ApplicationController
  def show
    @member = Member.find(current_member.id)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update

  end

  def resignation
  end

  def quit
  end

  private
  def member_params
    params.require(:member).permit(:email)
  end
end
