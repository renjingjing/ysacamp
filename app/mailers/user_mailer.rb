class UserMailer < ApplicationMailer
  def send_password_reset_instructions(user)
    @user = user
    mail(to: @user.email1, subject: "Reset your password")
  end
end
