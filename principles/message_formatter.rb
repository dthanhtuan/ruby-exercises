# Problem: Original class handled:
# - Email sending
# - Message formatting
# - Activity logging
# This violates Single Responsibility Principle (SRP).
######################################################
# Solution: Split into separate classes.
# # app/services/email_sender.rb : New EmailSender class focuses only on sending emails.
# # app/services/message_formatter.rb :New MessageFormatter class handles message formatting.
class MessageFormatter
  def self.format(content)
    content.upcase
  end
end
