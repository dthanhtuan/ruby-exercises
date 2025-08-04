# Proxy is a structural design pattern that lets you provide a substitute or placeholder for another object.
# A proxy controls access to the original object,
# allowing you to perform something either before or after the request gets through to the original object.

# Real object handling main business logic
class RealAPI
  def fetch_data(user)
    "Sensitive data for #{user}"
  end
end

# Proxy controlling access and logging
class APIProxy
  ALLOWED_USERS = ['admin', 'manager']

  def initialize(real_api)
    @real_api = real_api
  end

  def fetch_data(user)
    if check_access(user)
      result = @real_api.fetch_data(user)
      log_access(user)
      result
    else
      "Access denied for #{user}"
    end
  end

  private

  def check_access(user)
    ALLOWED_USERS.include?(user)
  end

  def log_access(user)
    puts "User #{user} accessed API at #{Time.now}"
  end
end

# Instantiate the real object and the proxy
real_api = RealAPI.new
proxy = APIProxy.new(real_api)

# Client calls via proxy
puts proxy.fetch_data('admin')   # Allowed
puts proxy.fetch_data('guest')   # Denied
