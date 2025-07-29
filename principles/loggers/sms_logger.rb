# Use module because we want to share share behavior, no contract enforcement
class SmsLogger
  def log(message)
    puts "sms_logger: #{message}"
  end
end
