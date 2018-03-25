class UserMailer < ApplicationMailer
  default from: "from@example.com"

  layout "mailer"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'louise.dyquiangco@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
