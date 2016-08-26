class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :first_name,:last_name,:user_type_id,:mobile_number, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit( :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :email, :first_name,:last_name,:user_type_id, :mobile_number, :password, :password_confirmation, :current_password) }
  end
end
