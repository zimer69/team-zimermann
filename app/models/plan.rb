# app/models/plan.rb
class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  
  validates :name, :price, :duration_days, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :duration_days, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }

  def formatted_price
    "R$ #{price.to_f}"
  end
end