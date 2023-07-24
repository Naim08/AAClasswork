class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if include?(key)
      return false
    else
      @count += 1
      if @count == num_buckets
        resize!
      end
      @store[key.hash % num_buckets] << key
      return true
    end

  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if include?(key)
      @count -= 1
      @store[key.hash % num_buckets].delete(key)
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets * 2) {Array.new}
    @count = 0
    old_store.flatten.each do |el|
      insert(el)
    end
  end

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end
end
