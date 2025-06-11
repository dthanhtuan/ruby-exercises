# Least Recently Used (LRU) cache.
# the last item in the hash is the most recently added or most recently updated item
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @cache = {}
  end

  def get(key)
    return -1 unless @cache.key?(key)

    value = @cache.delete(key)
    @cache[key] = value # Re-insert to update order (most recently used)
    value
  end

  def put(key, value)
    @cache.delete(key) if @cache.key?(key)
    @cache[key] = value
    if @cache.size > @capacity
      @cache.shift # Removes the least recently used (oldest) item
    end
  end
end

cache = LRUCache.new(2) # Set cache capacity to 2

cache.put(1, 1) # cache is {1=>1}
cache.put(2, 2) # cache is {1=>1, 2=>2}
puts cache.get(1) # returns 1, cache is {2=>2, 1=>1}
cache.put(3, 3) # evicts key 2, cache is {1=>1, 3=>3}
puts cache.get(2) # returns -1 (not found)
cache.put(4, 4) # evicts key 1, cache is {3=>3, 4=>4}
puts cache.get(1) # returns -1 (not found)
puts cache.get(3) # returns 3
puts cache.get(4)  # returns 4
