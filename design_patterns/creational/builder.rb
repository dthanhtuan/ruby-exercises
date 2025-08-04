# Builder is a creational design pattern that lets you construct complex objects step by step.
# The pattern allows you to produce different types and representations of an object using the same construction code.

# Product: Car and Parts
class Car
  attr_accessor :engine, :wheels, :body, :doors, :color, :windshield, :container_part

  def specifications
    {
      engine: engine,
      wheels: wheels,
      body: body,
      doors: doors,
      color: color,
      windshield: windshield,
      container_part: container_part
    }
  end
end

# Base Builder Interface
class CarBuilder
  attr_reader :car

  def initialize
    @car = Car.new
  end

  def build_engine; end
  def build_wheels; end
  def build_body; end
  def add_doors; end
  def paint; end
end

# Concrete Builder for a Sports Car
class SportCarBuilder < CarBuilder
  def build_engine
    @car.engine = "V8 Turbo"
  end

  def build_wheels
    @car.wheels = [18, 18, 18, 18]
  end

  def build_body
    @car.body = "Sport"
  end

  def add_doors
    @car.doors = 2
  end

  def build_windshield
    @car.windshield = "Aerodynamic sport windshield"
  end

  def paint
    @car.color = "Red"
  end
end

# Concrete Builder for a Container Truck
class ContainerTruckBuilder < CarBuilder
  def build_engine
    @car.engine = "Diesel 6-cylinder"
  end

  def build_wheels
    @car.wheels = [22, 22, 22, 22, 22, 22]
  end

  def build_body
    @car.body = "Container Truck"
  end

  def add_doors
    @car.doors = 2
  end

  # Only Container Trucks have a container part
  def build_container_part
    @car.container_part = "Large cargo container"
  end

  def paint
    @car.color = "White"
  end
end

# Concrete Builder for a Family Car
class FamilyCarBuilder < CarBuilder
  def build_engine
    @car.engine = "Hybrid 4-cylinder"
  end

  def build_wheels
    @car.wheels = [16, 16, 16, 16]
  end

  def build_body
    @car.body = "Sedan"
  end

  def add_doors
    @car.doors = 4
  end

  def build_windshield
    @car.windshield = "Standard windshield"
  end

  def paint
    @car.color = "Blue"
  end
end

# Director to manage the building process
class CarDirector
  def initialize(builder)
    @builder = builder
  end

  def build_car
    @builder.build_engine
    @builder.build_wheels
    @builder.build_body
    @builder.add_doors

    # Call optional methods if they exist
    @builder.build_windshield if @builder.respond_to?(:build_windshield)
    @builder.build_container_part if @builder.respond_to?(:build_container_part)

    @builder.paint
    @builder.car
  end
end

# Example usage
sport_builder = SportCarBuilder.new
director = CarDirector.new(sport_builder)
sport_car = director.build_car
puts "Sport Car: #{sport_car.specifications}"

container_builder = ContainerTruckBuilder.new
director = CarDirector.new(container_builder)
container_truck = director.build_car
puts "Container Truck: #{container_truck.specifications}"


