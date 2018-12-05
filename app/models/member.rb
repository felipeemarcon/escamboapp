class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # RatyRate Gem 
  ratyrate_rater

  # Associations
  has_many :ads
  has_many :comments
  has_one :profile_member
  accepts_nested_attributes_for :profile_member
  
end
