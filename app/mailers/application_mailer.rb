class ApplicationMailer < ActionMailer::Base
  default from: 'postmaster@mg.medbot.me'
  default "Message-ID"=>lambda {"<#{SecureRandom.uuid}@#{ActionMailer::Base.smtp_settings[:domain]}>"}
  layout 'mailer'
end
