class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:full_access, :restricted_access]

  def role_descrition
    if self.role == 'full_access'
      'Acesso completo'
    else
      'Acesso restrito'
    end
  end
end
