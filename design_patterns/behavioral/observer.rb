# The Observer Design Pattern is a behavioral design pattern that establishes a one-to-many dependency between objects.
# When one object — called the Subject (or Observable) — changes its state,
# all its dependent objects — called Observers — are automatically notified and updated.


# Subject interface
class Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each(&:update)
  end
end

# Concrete Subject (Weather Station)
class WeatherStation < Subject
  attr_reader :temperature

  def initialize
    super()
    @temperature = 0
  end

  def temperature=(new_temp)
    @temperature = new_temp
    notify_observers
  end
end

# Observer interface
class Observer
  def update
    raise NotImplementedError
  end
end

# Concrete Observer (Display Device)
class TemperatureDisplay < Observer
  def initialize(weather_station)
    @weather_station = weather_station
    weather_station.add_observer(self)
  end

  def update
    puts "Temperature updated to #{@weather_station.temperature}°C"
  end
end

# Usage
weather_station = WeatherStation.new
display = TemperatureDisplay.new(weather_station)

weather_station.temperature = 25
weather_station.temperature = 30
