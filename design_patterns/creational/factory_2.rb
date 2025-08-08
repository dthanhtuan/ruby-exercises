# Abstract product interfaces
class Button
  def paint
    raise NotImplementedError, 'You must implement the paint method'
  end
end

class TextField
  def render
    raise NotImplementedError, 'You must implement the render method'
  end
end

# Concrete products for Windows
class WindowsButton < Button
  def paint
    puts 'Painting a Windows style button'
  end
end

class WindowsTextField < TextField
  def render
    puts 'Rendering a Windows style text field'
  end
end

# Concrete products for Mac
class MacButton < Button
  def paint
    puts 'Painting a Mac style button'
  end
end

class MacTextField < TextField
  def render
    puts 'Rendering a Mac style text field'
  end
end

# Abstract Factory interface
class UIFactory
  def create_button
    raise NotImplementedError, 'You must implement the create_button method'
  end

  def create_text_field
    raise NotImplementedError, 'You must implement the create_text_field method'
  end
end

# Concrete factory for Windows
class WindowsFactory < UIFactory
  def create_button
    WindowsButton.new
  end

  def create_text_field
    WindowsTextField.new
  end
end

# Concrete factory for Mac
class MacFactory < UIFactory
  def create_button
    MacButton.new
  end

  def create_text_field
    MacTextField.new
  end
end

# Client code
def client_code(factory)
  button = factory.create_button
  text_field = factory.create_text_field

  button.paint
  text_field.render
end

# Let's say the current platform is detected or set dynamically:
current_os = :mac  # :windows or :mac

factory = case current_os
          when :windows then WindowsFactory.new
          when :mac then MacFactory.new
          else raise 'Unsupported OS'
          end

client_code(factory)
