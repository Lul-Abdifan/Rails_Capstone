class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to recipes_path, alert: 'You are not authorized to access this page.'
  end
end
