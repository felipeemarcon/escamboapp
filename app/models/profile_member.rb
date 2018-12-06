class ProfileMember < ActiveRecord::Base

  belongs_to :member

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
