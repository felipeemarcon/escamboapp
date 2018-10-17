class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:full_access, :restricted_access]

  # scope :whit_full_access, -> { where(role: 'full_access') }

  def self.whit_full_access
    where(role: 'full_access') 
  end

  def role_descrition
    if self.role == 'full_access'
      'Acesso completo'
    else
      'Acesso restrito'
    end
  end
end
