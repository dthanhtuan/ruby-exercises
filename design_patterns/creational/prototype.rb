# Prototype is a creational design pattern that lets you copy existing objects
# without making your code dependent on their classes.

# n Ruby, you can use built-in shallow copy methods like dup or clone for the Prototype pattern.
# Prototype base class
class SessionTemplate
  attr_accessor :settings

  def initialize(settings)
    @settings = settings
  end

  def clone
    # Use dup for shallow copy; override for deep copy if needed
    self.dup
  end
end

# Different session types inherit and can be cloned easily
class UserSession < SessionTemplate
  def customize(user_id)
    @settings[:user_id] = user_id
  end
end

# Usage
default_session = UserSession.new(theme: 'dark', timeout: 30)
user1_session = default_session.clone
user1_session.customize(101)

user2_session = default_session.clone
user2_session.customize(202)

puts default_session.settings # {:theme=>"dark", :timeout=>30}
puts user1_session.settings   # {:theme=>"dark", :timeout=>30, :user_id=>101}
puts user2_session.settings   # {:theme=>"dark", :timeout=>30, :user_id=>202}
