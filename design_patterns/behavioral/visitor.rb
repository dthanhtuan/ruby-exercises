# Visitor Pattern is a behavioral design pattern that allows you to add new operations (behaviors) to a group of objects
# without changing their classes. It separates an algorithm from the objects on which it operates,
# which is useful when you want to perform different,
# unrelated operations on a set of objects while keeping the objects themselves untouched.



# Element interface
class Building
  def accept(visitor)
    raise NotImplementedError, "Subclasses must implement accept"
  end
end

# Concrete elements
class ResidentialBuilding < Building
  def accept(visitor)
    visitor.visit_residential(self)
  end
end

class Bank < Building
  def accept(visitor)
    visitor.visit_bank(self)
  end
end

class CoffeeShop < Building
  def accept(visitor)
    visitor.visit_coffee_shop(self)
  end
end

# Visitor interface
class InsuranceAgent
  def visit_residential(residential)
    puts "Selling medical insurance to residential building."
  end

  def visit_bank(bank)
    puts "Selling theft insurance to bank."
  end

  def visit_coffee_shop(coffee_shop)
    puts "Selling fire and flood insurance to coffee shop."
  end
end

# Usage
buildings = [ResidentialBuilding.new, Bank.new, CoffeeShop.new]
agent = InsuranceAgent.new

buildings.each do |building|
  building.accept(agent)
end

# Output:
# Selling medical insurance to residential building.
# Selling theft insurance to bank.
# Selling fire and flood insurance to coffee shop.