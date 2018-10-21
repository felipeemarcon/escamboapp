class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Gem money-rails
  monetize :price_cents
end
