require_relative 'base_sender'
require_relative '../loggers/sms_logger'
class SmsSender < BaseSender
  def initialize(logger: SmsLogger.new)
    super()
    @logger = logger
  end

  def send_message(user, message)
    # Only sms send logic
    @logger.log("Sms sent to #{user.phone}, message: #{message}")
  end
end

