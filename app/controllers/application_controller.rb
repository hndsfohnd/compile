class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname,:lastname,:firstname_kana,:lastname_kana,:birthday,:mileage,:seat_request,:email,:password,:passport_number,:passport_valid])
  end
end
