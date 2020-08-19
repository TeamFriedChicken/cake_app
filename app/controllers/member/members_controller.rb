class Member::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
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
end
