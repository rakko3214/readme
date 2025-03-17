class UserMailer < ApplicationMailer
  def test_email
    mail(to: "me32140941@gmail.com", subject: "テストメール")
  end
end
