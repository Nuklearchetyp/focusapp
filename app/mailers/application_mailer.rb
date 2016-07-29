class ApplicationMailer < ActionMailer::Base
  default from: ENV["MAILER_ADRESS"]
  layout 'mailer'
end
