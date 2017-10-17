class CustomMailer < Devise::Mailer
  default message_id: "<#{SecureRandom.uuid}@mg.medbot.me>"
  layout 'mailer'
end
