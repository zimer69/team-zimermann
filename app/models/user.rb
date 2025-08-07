# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Serialize roles as array
  serialize :roles, Array

  # Relationships (we'll create these models next)
  has_one :athlete_profile, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :workout_completions, dependent: :destroy

  # Validations
  validates :first_name :last_name, presence: true
  validates :roles, presence: true

  # Callbacks
  after_create :create_athlete_profile, if: :athlete?
  before_validation :set_default_roles, on: :create

  # Role methods
  def admin?
    roles.include?('admin')
  end

  def athlete?
    roles.include?('athlete')
  end

  def coach?
    roles.include?('coach')
  end

  def super_admin?
    roles.include?('super_admin')
  end

  def add_role(role)
    roles << role.to_s unless roles.include?(role.to_s)
    save
  end

  def remove_role(role)
    roles.delete(role.to_s)
    save
  end

  def primary_role
    return 'Super Admin' if super_admin?
    return 'Admin' if admin?
    return 'Coach' if coach?
    return 'Athlete' if athlete?
    'User'
  end

  def role_names
    roles.map(&:humanize).join(', ')
  end

  private

  def create_athlete_profile
    AthleteProfile.create!(user: self, first_name: first_name, last_name: last_name)
  end

  def set_default_roles
    self.roles = ['athlete'] if roles.blank?
  end
end