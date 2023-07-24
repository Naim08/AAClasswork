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
  end

  def [](i)
    if i < 0
      return nil if i < -@count
      return @store[@count + i]
    end
    return nil if i >= @count
    @store[i]
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
    @count += 1
    (@count - 1).downto(1) do |i|
      @store[i] = @store[i - 1]
    end
    @store[0] = val

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
