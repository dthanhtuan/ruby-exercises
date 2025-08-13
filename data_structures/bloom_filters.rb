require 'mmh3'           # Gem for MurmurHash3 hashing
require 'bitarray'       # Gem for bit array

class SimpleBloomFilter
  def initialize(size = 100, num_of_hash_functions = 3)
    @size = size
    @bit_array = BitArray.new(size)
    @num_of_hash_functions = num_of_hash_functions
  end

  # Add an element to the Bloom filter
  def add(element)
    hashes(element).each do |hash_val|
      @bit_array[hash_val] = 1
    end
  end

  # Check if an element is probably present in the filter
  def include?(element)
    hashes(element).all? { |hash_val| @bit_array[hash_val] == 1 }
  end

  private

  # The number of hash functions (@hash_functions in the code)
  # determines how many hash values (bit positions) are generated for each element.
  def hashes(element)
    (0...@num_of_hash_functions).map do |seed|
      Mmh3.hash128(element, seed: seed) % @size
    end
  end
end

# Example usage:
bf = SimpleBloomFilter.new(100, 3)
bf.add("apple")
bf.add("banana")

puts bf.include?("apple")   # Expected output: true (probably present)
puts bf.include?("banana")  # Expected output: true (probably present)
puts bf.include?("grape")   # Expected output: false (definitely not present)
