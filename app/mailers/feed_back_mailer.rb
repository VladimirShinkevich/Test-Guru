class FeedBackMailer < ApplicationMailer
  ADMIN_EMAIL = 'vladimirshinkevich1988@gmail.com'

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL
  end
end
