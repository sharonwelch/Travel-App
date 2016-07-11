class ApplicationMailer < ActionMailer::Base
  default from: "from@quirk.com"
  layout 'mailer'
end
