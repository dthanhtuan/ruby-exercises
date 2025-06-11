class BaseSender
  def initialize
    @sender = nil
  end

  def send_message(message)
    raise NotImplementedError, "This method should be overridden in a subclass"
  end
end
