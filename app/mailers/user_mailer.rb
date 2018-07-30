class UserMailer < ApplicationMailer
  default from: "jacubco@tutanota.com"

  def contact_form(email, name, message)
  @message = message
    mail(
      from: email,
      to: 'jacubco@tutanota.com',
      subject: "A new contact form message from #{name}"
    )
  end
end
