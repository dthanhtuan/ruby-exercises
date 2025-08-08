# Iterator Interface (protocol)
class Iterator
  def has_next?
    raise NotImplementedError
  end

  def next
    raise NotImplementedError
  end
end

# Concrete Iterator for an array
class ArrayIterator < Iterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.size
  end

  def next
    element = @array[@index]
    @index += 1
    element
  end
end

# Aggregate Interface
class Aggregate
  def create_iterator
    raise NotImplementedError
  end
end

# Concrete Aggregate
class NumbersCollection < Aggregate
  def initialize(numbers)
    @numbers = numbers
  end

  def create_iterator
    ArrayIterator.new(@numbers)
  end
end

# Usage
collection = NumbersCollection.new([1, 2, 3, 4, 5])
iterator = collection.create_iterator

while iterator.has_next?
  puts iterator.next
end
