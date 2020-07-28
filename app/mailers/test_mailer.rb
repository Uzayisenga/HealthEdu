class TestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.hello.subject
  #
  default from: 'healthedultd@healtheducat.rw'

  def hello
    @greeting = 'Hi'
    mail to: 'auzayisenga@akilahinstitute.org', subject: 'Hello from Postmark', track_opens: true
  end
end
