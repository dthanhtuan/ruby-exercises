# Target interface the client expects
class Notifier
  def notify(recipient, message)
    raise NotImplementedError, 'You must implement the notify method'
  end
end

# Modern SMS service with send_message method
class SmsService
  def send_message(phone_number, text)
    puts "Sending SMS to #{phone_number}: #{text}"
  end
end

# Old Email service with deliver method
class EmailService
  def deliver(to_address, subject, body)
    puts "Sending Email to #{to_address} with subject '#{subject}' and body '#{body}'"
  end
end

# Adapter for SMS service to adapt it to Notifier interface
class SmsAdapter < Notifier
  def initialize(sms_service)
    @sms_service = sms_service
  end

  def notify(recipient, message)
    # SMS service expects phone number and text
    @sms_service.send_message(recipient, message)
  end
end

# Adapter for Email service to adapt it to Notifier interface
class EmailAdapter < Notifier
  def initialize(email_service)
    @email_service = email_service
  end

  def notify(recipient, message)
    # Email service expects to_address, subject, and body
    subject = "Notification"
    body = message
    @email_service.deliver(recipient, subject, body)
  end
end

# Client code using Notifier interface
def send_notification(notifier, recipient, message)
  notifier.notify(recipient, message)
end

# Usage

sms_service = SmsService.new
sms_notifier = SmsAdapter.new(sms_service)

email_service = EmailService.new
email_notifier = EmailAdapter.new(email_service)

send_notification(sms_notifier, '+1234567890', 'Your order has shipped!')
send_notification(email_notifier, 'user@example.com', 'Your order has shipped!')
