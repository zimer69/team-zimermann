# app/controllers/athlete/profiles_controller.rb
class Athlete::ProfilesController < ApplicationController
  before_action :ensure_athlete
  before_action :set_profile, only: [:show, :edit, :update]

  def update
    if @profile.update(profile_params)
      redirect_to athlete_profile_path, notice: 'Profile updated successfully!'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.athlete_profile || current_user.build_athlete_profile
  end

  def profile_params
    params.require(:athlete_profile).permit(
      :full_name, :height, :weight, :date_of_birth, :gender, 
      :fitness_level, :goals, :medical_conditions, :whatsapp, 
      :city, :emergency_contact_name, :emergency_contact_phone
    )
  end

  def ensure_athlete
    redirect_to root_path unless current_user&.athlete?
  end
end