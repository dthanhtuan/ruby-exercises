# frozen_string_literal: true

class BaseCreator
  def create_product
    raise NotImplementedError, 'You must implement the create_product method'
  end

  def some_operation
    product = create_product
    puts "Run operation on #{product.operation}"
  end
end

class ConcreteCreatorA < BaseCreator
  def create_product
    ConcreteProductA.new
  end
end

class ConcreteCreatorB < BaseCreator
  def create_product
    ConcreteProductB.new
  end
end

class BaseProduct
  def operation
    raise NotImplementedError, 'You must implement the use method'
  end
end

class ConcreteProductA < BaseProduct
  def operation
    'Using ConcreteProductA'
  end
end

class ConcreteProductB < BaseProduct
  def operation
    'Using ConcreteProductB'
  end
end

def client_code(creator)
  # LSP, polymorphism: client code can work with any concrete creator
  puts creator.some_operation
end

creator = ConcreteCreatorA.new
client_code(creator)


