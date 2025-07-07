# class Config
#   def initialize
#     @settings = {}
#   end
#
#   def self.instance
#     @instance ||= new
#   end
#
#   def set(key, value)
#     @settings[key] = value
#   end
#
#   def get(key)
#     @settings[key]
#   end
# private_class_method :new
# end
#
# config = Config.instance
# config.set(:api_key, "12345")
# puts config.get(:api_key) # => "12345"



class SingletonExample
  @instance = nil

  private_class_method :new
  # Ensures that only one instance of the class can be created
  def self.instance
    @instance ||= new
  end

  def some_method
    "I'm the only instance!"
  end
end

# Usage:
obj1 = SingletonExample.instance
obj2 = SingletonExample.instance
puts obj1 == obj2 # => true


