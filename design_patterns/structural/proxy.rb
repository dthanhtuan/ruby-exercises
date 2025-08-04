# The Proxy "is a wrapper class that controls access to the real object and can be used as a substitute for it
# In this example, the APIProxy acts as an intermediary that controls and extends the behavior of RealAPI without the client needing to be aware of it.
# This is a classic use of the Proxy Pattern in web development to improve security, optimize performance, and monitor access

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
