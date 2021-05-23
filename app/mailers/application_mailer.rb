class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@testgoru.com>}
  layout 'mailer'
end
