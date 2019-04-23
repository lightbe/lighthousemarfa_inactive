class ApplicationMailer < ActionMailer::Base
  default from: "The Lighthouse Unlimited <thelighthouseunlimited@gmail.com>", reply_to: "The Lighthouse Unlimited <thelighthouseunlimited@gmail.com>"
  layout 'mailer'
end
