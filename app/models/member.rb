class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # RatyRate Gem 
  ratyrate_rater

  # Validations
  validate :nested_attributes

  # Associations
  has_many :ads
  has_many :comments
  has_one :profile_member
  accepts_nested_attributes_for :profile_member
  
  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "É necessário preencher os campos Nome e Sobrenome.")
    end
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.last_name.blank?    
  end
end
