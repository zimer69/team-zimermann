# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, roles: [])
  end

  def after_sign_up_path_for(resource)
    if resource.athlete? && !resource.athlete_profile.present?
      # Redirect to complete profile
      edit_athlete_profile_path
    elsif resource.admin?
      admin_root_path
    else
      athlete_root_path
    end
  end
end