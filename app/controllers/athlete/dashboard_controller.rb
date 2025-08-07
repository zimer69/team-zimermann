# app/controllers/athlete/dashboard_controller.rb
class Athlete::DashboardController < ApplicationController
  before_action :ensure_athlete

  def index
    @subscription = current_user.subscriptions.active.last
    @profile = current_user.athlete_profile
  end

  private

  def ensure_athlete
    redirect_to root_path unless current_user&.athlete?
  end
end