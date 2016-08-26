class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name,:last_name,:user_type_id,:mobile_number, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name,:last_name,:user_type_id, :mobile_number, :password, :password_confirmation, :current_passworde])
  end
end
