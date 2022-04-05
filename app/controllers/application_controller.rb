class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :update_allowed_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role, :avatar)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :role, :avatar)}
  end
end
