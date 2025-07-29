# frozen_string_literal: true
require_relative 'senders/email_sender'
require_relative 'senders/sms_sender'
require_relative 'message_formatter'
class NotificationSystem
  def initialize(user, message, sender, formatter: MessageFormatter)
    @user = user
    @message = formatter.format(message)
    @sender = sender
  end

  def execute
    @sender.send_message(@user, @message)
  end
end

# Usage:
User = Struct.new(:email, :phone)
user = User.new(email: 'testingemail@gmail.com',phone: '1234567890')
message = 'Hello, this is a test message!'
notification_system = NotificationSystem.new(user, message, EmailSender.new)
notification_system.execute

notification_system = NotificationSystem.new(user, message, SmsSender.new)
notification_system.execute
