# app/models/notification_handler.rb
# Violations:
#
## Single Responsibility Principle: Handles sending, formatting, and logging
## Open/Closed Principle: Hard to extend without modification
## Interface Segregation: Monolithic interface
class NotificationBeforeSolidHandler
  def send_email(user, message)
    # Email sending logic
    log_activity("Email sent to #{user.email}, message: #{message}")
  end

  def send_sms(user, message)
    # SMS sending logic
    log_activity("SMS sent to #{user.phone}, message: #{message}")
  end

  def format_message(content)
    # Message formatting logic
    content.upcase
  end

  private

  def log_activity(message)
    # Logging logic
    puts "log_activity: #{message}"
  end
end
