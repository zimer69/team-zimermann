# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      athlete_root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, roles: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, roles: []])
  end

  # Authorization helpers
  def ensure_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user&.admin?
  end

  def ensure_athlete
    redirect_to root_path, alert: 'Access denied.' unless current_user&.athlete?
  end
end