class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {:full_access => 0, :restricted_access => 1}

  scope :whit_full_access, -> { where(role: 'full_access') } 
  
end
