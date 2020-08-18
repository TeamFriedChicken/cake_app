class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
    	:email,
    	:last_name,
		:first_name,
		:kana_last_name,
		:kana_first_name,
		:phone_number,
		:address,
		:postcode,])
  end
end