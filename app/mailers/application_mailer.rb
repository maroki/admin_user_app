class ApplicationMailer < ActionMailer::Base
  default from: 'support@letter.com'
  layout 'mailer'
end
