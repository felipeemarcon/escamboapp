class Category < ActiveRecord::Base

  has_many :ads

  # Validations
  validates :description, presence: true

  # Scopes
  scope :order_by_description, -> { order(:description) }
end
