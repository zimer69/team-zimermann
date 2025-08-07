# app/models/athlete_profile.rb
class AthleteProfile < ApplicationRecord
  belongs_to :user

  # Enums for standardized data
  enum gender: { 
    male: 'male', 
    female: 'female', 
    other: 'other', 
    prefer_not_to_say: 'prefer_not_to_say' 
  }
  
  enum fitness_level: { 
    beginner: 'beginner', 
    intermediate: 'intermediate', 
    advanced: 'advanced', 
    elite: 'elite' 
  }

  # Validations
  validates :first_name :last_name, presence: true
  validates :height, presence: true, numericality: { greater_than: 0, less_than: 240 } # cm
  validates :weight, presence: true, numericality: { greater_than: 0, less_than: 500 } # kg
  validates :age, numericality: { greater_than: 0, less_than: 120 }
  validates :gender, presence: true
  validates :whatsapp, presence: true
  validates :city, presence: true

  # Callbacks
  before_validation :calculate_age_from_birth_date, if: :date_of_birth?

  private

  def calculate_age_from_birth_date
    return unless date_of_birth.present?
    self.age = ((Date.current - date_of_birth) / 365.25).floor
  end
end