class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @start = 0
    @end = capacity
  end

  def [](i)
    if i < 0
      return nil if i < -@count
      return @store[@count + i]
    end
    return nil if i >= @count
    if @start != @count
      @store[(@start + i) % @count]
    else
      @store[i]
    end
  end

  def []=(i, val)
    if i < 0
      return nil if i < -@count
      @store[@count + i] = val
      return val
    end
    return nil if i >= @count
    @store[i] = val
    val
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each do |el|
      return true if el == val
    end
    false
  end

  def push(val)
    if capacity == @count
      resize!
    end
    @store[@count] = val
    @count += 1
  end

  def unshift(val)
    if capacity == @count
      resize!
    end
    @start = (@start - 1) % capacity
    @store[@start] = val
    @count += 1

  end

  def pop
    return nil if @count == 0
    @count -= 1
    popped = @store[@count]
    @store[@count] = nil
    popped
  end

  def shift
    return nil if @count == 0
    shifted = @store[0]
    @count -= 1
    1.upto(@count) do |i|
      @store[i - 1] = @store[i]
    end
    @store[@count] = nil
    shifted
  end

  def first
    @store[0]
  end

  def last
    @store[@count - 1]
  end

  def each
    @count.times do |i|
      yield(@store[i])
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end


  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    self.each_with_index do |el, i|
      return false unless el == other[i]
    end
    true
  end

  alias_method :<<, :push
  %i(length size).each { |method| alias_method method, :count }

  private

  def resize!
    new_store = StaticArray.new(self.capacity * 2)
    self.each_with_index do |el, i|
      new_store[i] = el
    end
    @store = new_store
  end
end


class RingBuffer
  def initialize(size)
    @size = size
    @buffer = Array.new(size)
    @start = 0
    @count = 0
  end
  def shift
    return nil if @count == 0
    val = @buffer[@start]
    @buffer[@start] = nil
    @start = (@start + 1) % @size
    @count -= 1
    val
  end
  def unshift(val)
    if @count == @size
      @buffer[@start] = val
      @start = (@start + 1) % @size
    else
      @start = (@start - 1) % @size
      @buffer[@start] = val
      @count += 1
    end
  end
  def push(val)
    if @count == @size
      @buffer[@start] = val
      @start = (@start + 1) % @size
    else
      @buffer[(@start + @count) % @size] = val
      @count += 1
    end
  end

  def pop
    return nil if @count == 0
    val = @buffer[(@start + @count - 1) % @size]
    @buffer[(@start + @count - 1) % @size] = nil
    @count -= 1
    val
  end
  def [](key)
    return nil if key >= @count
    @buffer[(@start + key) % @size]
  end
  def to_a
    result = []
    @count.times do |i|
      result << @buffer[(@start + i) % @size]
    end
    result
  end
end
