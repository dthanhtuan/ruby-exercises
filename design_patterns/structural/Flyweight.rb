# The Flyweight pattern is a structural design pattern used to reduce memory usage by sharing as much data as possible among similar objects
# Flyweight represents the shared intrinsic state: the icon image data
class IconFlyweight
  attr_reader :icon_name

  def initialize(icon_name)
    @icon_name = icon_name
    load_image
  end

  def load_image
    # Simulate loading image data from disk or resource
    puts "Loading image data for icon: #{@icon_name}"
    # In a real system, this might load an actual image file into memory
  end

  def draw(position_x, position_y)
    # Use extrinsic state (position) passed in to perform an action
    puts "Drawing icon '#{@icon_name}' at (#{position_x}, #{position_y})"
  end
end

# Flyweight factory: manages and reuses IconFlyweight instances
class IconFactory
  def initialize
    @icons = {}
  end

  # Returns an existing flyweight if it exists, or creates a new one
  def get_icon(icon_name)
    @icons[icon_name] ||= IconFlyweight.new(icon_name)
  end

  def total_icons_created
    @icons.size
  end
end

# Client code
icon_factory = IconFactory.new

# Positions where icons will be drawn (extrinsic state)
positions = [
  [10, 20],
  [15, 25],
  [10, 20],
  [30, 40]
]

# Icons to draw (some repeated to demonstrate sharing)
icon_names = ["save", "open", "save", "close"]

# Draw icons, reusing IconFlyweight objects when possible
icon_names.each_with_index do |name, index|
  icon = icon_factory.get_icon(name)
  x, y = positions[index]
  icon.draw(x, y)
end

puts "Total unique icon objects created: #{icon_factory.total_icons_created}"
