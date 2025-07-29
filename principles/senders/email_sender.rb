# Problem: Original class handled:
# - Email sending
# - Message formatting
# - Activity logging
# This violates Single Responsibility Principle (SRP).
######################################################
# Solution: Split into separate classes.
# # app/services/email_sender.rb : New EmailSender class focuses only on sending emails.
# # app/services/message_formatter.rb :New MessageFormatter class handles message formatting.

# EmailSender: Handles the mechanics of sending, logging, and error handling.
# # EmailNotifier: "A new user signed up, so let's notify them."
# # EmailSender: "I'll call the mailer, deliver the email, and log this event."
# # UserMailer: "Here's the email template and subject; I'll send it to the user."
require_relative 'base_sender'
require_relative '../loggers/activity_logger'
class EmailSender < BaseSender
  def initialize(logger = ActivityLogger.new)
    super()
    @logger = logger
  end

  def send_message(user, message)
    # Only email logic
    # UserMailer.notification(user, message).deliver_now
    @logger.log("Email sent to #{user.email} with message: #{message}")
  end
end

