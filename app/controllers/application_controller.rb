class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :first_name,:last_name,:user_type_id,:mobile_number, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.for(:sign_in) << [:email, :password, :remember_me]
    devise_parameter_sanitizer.for(:account_update) << [:email, :first_name,:last_name,:user_type_id, :mobile_number, :password, :password_confirmation, :current_passworde]
  end
end
