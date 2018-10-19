class AdminMailer < ApplicationMailer

  def update_email(current_admin, admin)
    @current_admin = current_admin
    @admin = admin
    mail(to: @admin.email, subject: "#{@admin.name}, seus dados foram alterados!")
  end

end
