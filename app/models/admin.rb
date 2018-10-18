class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Constants
  ROLES = {:full_access => 0, :restricted_access => 1}
  
  # Enums
  enum role: ROLES

  # Scopes
  scope :whit_full_access, -> { where(role: 0) } 
  scope :whit_restricted_access, -> { where(role: 1) } 
  
end
