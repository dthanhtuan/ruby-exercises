# Strategies
class SortingStrategy
  def sort(data)
    raise NotImplementedError, 'This method should be overridden by subclasses'
  end
end

class SortingByName < SortingStrategy
  def sort(data)
    data.sort_by { |item| item[:name] }
  end
end

class SortingByAge < SortingStrategy
  def sort(data)
    data.sort_by { |item| item[:age] }
  end
end

# Class that uses the strategy
class EmployeeSorter
  def initialize(strategy)
    @strategy = strategy
  end

  def sort_employees(data)
    @strategy.sort(data)
  end
end

# Example usage
employees = [
  { name: 'Alice', age: 30 },
  { name: 'Bob', age: 25 },
  { name: 'Charlie', age: 35 }
]

# Sort by name
name_sorter = EmployeeSorter.new(SortingByName.new)
puts "Sorted by name:"
puts name_sorter.sort_employees(employees)

# Sort by age
age_sorter = EmployeeSorter.new(SortingByAge.new)
puts "Sorted by age:"
puts age_sorter.sort_employees(employees)


