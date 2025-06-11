# frozen_string_literal: true

Entry = Struct.new(:key, :value)

class HashTable
  def initialize(size)
    @size = size
    @table ||= Array.new(@size) { [] } # Initialize with empty arrays
  end

  def insert(key, value)
    index = hash_function(key)
    is_existed_entry = @table[index].any? { |pair| pair.key == key }
    return if is_existed_entry

    @table[index] << Entry.new(key, value)
  end

  def get(key)
    index = hash_function(key)
    pair = @table[index].find { |p| p.key == key }
    pair&.value
  end

  def delete(key)
    index = hash_function(key)
    delete_bucket = @table[index]
    return unless delete_bucket

    delete_bucket.delete_if { |pair| pair.key == key }
  end

  private

  def hash_function(key)
    key.hash % @size
  end
end


# Test Cases
ht = HashTable.new(3)  # Small size to force collisions

# Test 1: Insert and retrieve
ht.insert(:name, "Alice")
puts ht.get(:name)  # => "Alice"

# Test 2: Prevent duplicate keys
ht.insert(:name, "Bob")
puts ht.get(:name)  # => "Alice" (unchanged)

# Test 3: Handle collisions
# Keys 0, 3, 6 will all hash to index 0 (since 0.hash % 3 = 0, 3.hash % 3 = 0, etc.)
ht.insert(0, "Zero")
ht.insert(3, "Three")
ht.insert(6, "Six")
puts ht.get(0)   # => "Zero"
puts ht.get(3)   # => "Three"
puts ht.get(6)   # => "Six"

# Test 4: Delete key
ht.delete(3)
puts ht.get(3)   # => nil
puts ht.get(0)   # => "Zero" (collision partner remains)

# Test 5: Non-existent key
puts ht.get(:missing)  # => nil

# Test 6: Different key types
ht.insert("counter", 100)
ht.insert(3.14, Math::PI)
puts ht.get("counter")  # => 100
puts ht.get(3.14)       # => 3.141592653589793

# Test 7: Bucket inspection (for collision verification)
puts ht.instance_variable_get(:@table)
# Sample output:
# [
#   [Entry.new(0, "Zero"), Entry.new(6, "Six")],  # Index 0 (collisions)
#   [],                                            # Index 1
#   [Entry.new(:name, "Alice"), Entry.new("counter", 100), Entry.new(3.14, Math::PI)]  # Index 2
# ]
