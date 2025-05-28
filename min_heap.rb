# frozen_string_literal: true

class MinHeap
  attr_reader :array, :count, :capacity, :heap_type

  def initialize(capacity, heap_type = :min)
    @capacity = capacity
    @heap_type = heap_type
    @array = Array.new(capacity)
    @count = 0
  end

  def build_heap(array)
    return if array.nil? || array.empty?

    @array = array.dup
    @count = array.size

    ((@count - 1) / 2).downto(0) do |i|
      percolate_down(i)
    end
  end

  def parent(index)
    return nil if index <= 0 || index >= @count

    (index - 1) / 2
  end

  def left_child(index)
    left = 2 * index + 1
    return nil if left >= @count

    left
  end

  def right_child(index)
    right = 2 * index + 2
    return nil if right >= @count

    right
  end

  def get_minimum
    return nil if @count.zero?

    @array[0]
  end

  def delete_minimum
    return nil if @count.zero?

    min_value = @array[0]
    @array[0] = @array[@count - 1]
    @array[@count - 1] = nil
    @count -= 1
    percolate_down(0)
    min_value
  end

  def insert(value)
    return if @count >= @capacity

    @array[@count] = value
    @count += 1
    percolate_up(@count - 1)
  end

  def swap(index1, index2)
    return if index1.negative? || index2.negative? || index1 >= @count || index2 >= @count

    @array[index1], @array[index2] = @array[index2], @array[index1]
  end

  def percolate_down(index)
    return if index.negative? || index >= @count

    smallest_index = index
    left = left_child(index)
    right = right_child(index)

    smallest_index = left if left && @array[left] && @array[left] < @array[smallest_index]
    smallest_index = right if right && @array[right] && @array[right] < @array[smallest_index]

    return unless smallest_index != index

    swap(index, smallest_index)
    percolate_down(smallest_index)
  end

  def percolate_up(index)
    return if index <= 0 || index >= @count

    parent_index = parent(index)
    return unless parent_index && @array[index] && @array[parent_index] && @array[index] < @array[parent_index]

    swap(index, parent_index)
    percolate_up(parent_index)
  end
end
