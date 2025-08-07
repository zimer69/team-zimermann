# app/models/subscription.rb
class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  enum status: { active: 0, blocked: 1, expired: 2 }

  validates :start_date, :end_date, presence: true
  validates :status, presence: true

  scope :active, -> { where(status: :active) }
  
  def days_remaining
    return 0 if expired? || end_date.past?
    (end_date - Date.current).to_i
  end

  def expired?
    end_date < Date.current
  end
end