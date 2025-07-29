# Use module because we want to share share behavior, no contract enforcement
class ActivityLogger
  def log(message)
    puts "log_activity: #{message}"
  end
end
