class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  before_action :set_search
  def set_search
    @search_i = Item.ransack(params[:q])
    @search_items = @search_i.result

    @search_m = Member.ransack(params[:q])
    @search_members = @search_m.result

    @search_g = Genre.ransack(params[:q])
    @search_genres = @search_g.result
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    	:email,
    	:last_name,
      :first_name,
      :kana_last_name,
      :kana_first_name,
      :phone_number,
      :address,
      :postcode,
      :prefecture_name,
      :prefecture_code
    ])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path
    when Member
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return new_admin_session_path if resource_or_scope == :admin
    root_path
  end

end