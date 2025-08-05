# The Bridge Pattern is a structural design pattern that separates an abstraction from its implementation,
# allowing both to vary independently.
# In the provided Ruby example, the `Shape` class (abstraction) is separated from the `DrawingAPI` classes (implementations).
# The `Shape` delegates the drawing details to the passed-in `DrawingAPI` object,
# demonstrating how the pattern uses dependency injection to link abstraction and implementation.
# This design promotes flexibility and extensibility by enabling changes in either abstraction or implementation without affecting the other.


# Implementation (Interface)
class DrawingAPI
  def draw_circle(x, y, radius)
    raise NotImplementedError
  end
end

# Concrete Implementation 1
class DrawingAPI1 < DrawingAPI
  def draw_circle(x, y, radius)
    puts "API1.circle at (#{x}, #{y}), radius #{radius}"
  end
end

# Concrete Implementation 2
class DrawingAPI2 < DrawingAPI
  def draw_circle(x, y, radius)
    puts "API2.circle at (#{x}, #{y}), radius #{radius}"
  end
end

# Abstraction (interface)
class Shape
  def initialize(drawing_api)
    @drawing_api = drawing_api
  end

  def draw
    raise NotImplementedError
  end

  def resize_by_percentage(pct)
    raise NotImplementedError
  end
end

# Refined Abstraction
class CircleShape < Shape
  def initialize(x, y, radius, drawing_api)
    super(drawing_api)
    @x = x
    @y = y
    @radius = radius
  end

  def draw
    @drawing_api.draw_circle(@x, @y, @radius)
  end

  def resize_by_percentage(pct)
    @radius *= pct
  end
end

# Client code
circle1 = CircleShape.new(5, 10, 3, DrawingAPI1.new)
circle2 = CircleShape.new(20, 30, 5, DrawingAPI2.new)

circle1.draw    # Output: API1.circle at (5, 10), radius 3
circle2.draw    # Output: API2.circle at (20, 30), radius 5

circle1.resize_by_percentage(2)
circle1.draw    # Output: API1.circle at (5, 10), radius 6
