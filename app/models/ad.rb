class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  # Validates 
  validates_presence_of :title, :description, :category, :price, :picture

  # Scopes
  scope :descending_order, -> (quantity = 10) { order(created_at: :desc).limit(quantity) }
  scope :to_the, -> (member) { where(member: member) }

  # paperclip
  has_attached_file :picture, styles: { medium: "320x150", thumb: "100X100>", display: "700x400#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # Gem money-rails
  monetize :price_cents
end
