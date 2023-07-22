class MinMaxStack
  def initialize
    @stack = []
    @max_stack = []
    @min_stack = []
  end

  def push(val)
    @stack.push(val)

    if @max_stack.empty? || val >= @max_stack.last
      @max_stack.push(val)
    end

    if @min_stack.empty? || val <= @min_stack.last
      @min_stack.push(val)
    end
  end

  def pop
    val = @stack.pop

    if val == @max_stack.last
      @max_stack.pop
    end

    if val == @min_stack.last
      @min_stack.pop
    end

    val
  end

  def max
    @max_stack.last
  end

  def min
    @min_stack.last
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end
end

class MinMaxStackQueue
  def initialize
    @in_stack = MinMaxStack.new
    @out_stack = MinMaxStack.new
  end

  def enqueue(val)
    @in_stack.push(val)
  end

  def dequeue
    if @out_stack.empty?
      until @in_stack.empty?
        @out_stack.push(@in_stack.pop)
      end
    end

    @out_stack.pop
  end

  def max
    maxes = []

    unless @in_stack.empty?
      maxes << @in_stack.max
    end

    unless @out_stack.empty?
      maxes << @out_stack.max
    end

    maxes.max
  end

  def min
    mins = []

    unless @in_stack.empty?
      mins << @in_stack.min
    end

    unless @out_stack.empty?
      mins << @out_stack.min
    end

    mins.min
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end
end

def windowed_max_range(arr, window_size)
  queue = MinMaxStackQueue.new
  best_range = nil

  arr.each_with_index do |el, i|
    queue.enqueue(el)

    if queue.size == window_size
      current_range = queue.max - queue.min

      if best_range.nil? || current_range > best_range
        best_range = current_range
      end

      queue.dequeue
    end
  end

  best_range
end


p windowed_max_range([1, 3, 2, 5, 4, 8], 5)
