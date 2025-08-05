# How It Works:
# The chain is built as Authentication -> Logging -> Compression.
#
# Each middleware can decide to handle or pass the request.
#
# Logging always processes and passes further (demonstrating multiple handlers processing).
#
# Authentication only handles valid tokens.
#
# Compression acts only if compression needed.
#
# If no middleware handles a request, prints "not handled".

# Abstract Handler
class Middleware
  attr_accessor :next_middleware

  def initialize(next_middleware = nil)
    @next_middleware = next_middleware
  end

  def call(request)
    if can_handle?(request)
      process(request)
    elsif next_middleware
      next_middleware.call(request)
    else
      puts "Request #{request} was not handled."
    end
  end

  def can_handle?(request)
    raise NotImplementedError
  end

  def process(request)
    raise NotImplementedError
  end
end

# Authentication Middleware
class Authentication < Middleware
  def can_handle?(request)
    request[:auth_token] == 'valid_token'
  end

  def process(request)
    puts "Authentication successful for user #{request[:user]}"
  end
end

# Logging Middleware
class Logging < Middleware
  def can_handle?(_request)
    true # Logs all requests
  end

  def process(request)
    puts "Logging request for user #{request[:user]} with action #{request[:action]}"
    # Pass further in chain even after logging
    next_middleware&.call(request)
  end
end

# Compression Middleware
class Compression < Middleware
  def can_handle?(request)
    request[:needs_compression]
  end

  def process(request)
    puts "Compressing response for user #{request[:user]}"
  end
end

# Client code: build chain and send requests
compression = Compression.new
logging = Logging.new(compression)
auth = Authentication.new(logging)

requests = [
  { user: 'alice', auth_token: 'valid_token', action: 'view_page', needs_compression: false },
  { user: 'bob', auth_token: 'invalid', action: 'download', needs_compression: true }
]

requests.each do |req|
  puts "---Processing request for #{req[:user]}---"
  auth.call(req)
end
