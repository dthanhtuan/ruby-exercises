# Product: House
class House
  attr_accessor :foundation, :walls, :windows, :roof

  def initialize
    @foundation = nil
    @walls = nil
    @windows = nil
    @roof = nil
  end

  def to_s
    "House with foundation: #{@foundation}, walls: #{@walls}, windows: #{@windows}, roof: #{@roof}"
  end
end

# Builder Interface
class HouseBuilder
  def build_foundation; end
  def build_walls; end
  def build_windows; end
  def build_roof; end
  def house; end
end

# Concrete Builder for Wooden House
class WoodenHouseBuilder < HouseBuilder
  def initialize
    @house = House.new
  end

  def build_foundation
    @house.foundation = "Wooden piles"
  end

  def build_walls
    @house.walls = "Wooden walls"
  end

  def build_windows
    @house.windows = "Wooden framed windows"
  end

  def build_roof
    @house.roof = "Wooden roof"
  end

  def house
    @house
  end
end

# Concrete Builder for Stone House
class StoneHouseBuilder < HouseBuilder
  def initialize
    @house = House.new
  end

  def build_foundation
    @house.foundation = "Concrete and stone"
  end

  def build_walls
    @house.walls = "Stone walls"
  end

  def build_windows
    @house.windows = "Stone framed windows"
  end

  def build_roof
    @house.roof = "Concrete roof"
  end

  def house
    @house
  end
end

# Director that controls the building process
class HouseDirector
  def initialize(builder)
    @builder = builder
  end

  def construct_house
    @builder.build_foundation
    @builder.build_walls
    @builder.build_windows
    @builder.build_roof
    @builder.house
  end
end

# Usage example:

# Build a wooden house
wooden_builder = WoodenHouseBuilder.new
director = HouseDirector.new(wooden_builder)
wooden_house = director.construct_house
puts wooden_house.to_s
# Output:
# House with foundation: Wooden piles, walls: Wooden walls, windows: Wooden framed windows, roof: Wooden roof

# Build a stone house
stone_builder = StoneHouseBuilder.new
director = HouseDirector.new(stone_builder)
stone_house = director.construct_house
puts stone_house.to_s
# Output:
# House with foundation: Concrete and stone, walls: Stone walls, windows: Stone framed windows, roof: Concrete roof
