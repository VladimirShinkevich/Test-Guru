# frozen_string_literal: true

class FeedBackMailer < ApplicationMailer
  ADMIN_EMAIL = 'vladimirshinkevich1988@mail.ru'

  def create(message)
    @message = message
    mail to: ADMIN_EMAIL, subject: 'Feedback'
  end
end
