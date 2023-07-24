class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator."makes the first element the accumulator if no default is given

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self[0]
    self.each_with_index do |el, idx|
      if idx == 0
        accumulator = el
      else
      accumulator = prc.call(accumulator, el)
      end
    end
    accumulator
  end

end

p [1,2,3].my_inject(1) {|acc, el| acc + el}
# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  if num < 2
    return false
  end

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end

  true
end

def primes(num)
  result = []
  i = 2
  while result.length < num
    if is_prime?(i)
      result << i
    end
    i += 1
  end
  result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2
  result = factorials_rec(num - 1)
  result << result[-1] * (num - 1)
  result
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices
  # of all duplicate elements. The keys are the duplicate elements; the values
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = {}
    self.each_with_index do |element, index|
      result[element] ||= []
      result[element] << index
      result[element] = result[element].sort
    end
    result.select { |key, value| value.length > 1 }
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    result = []
    (0...self.length).each do |i|
      (i...self.length).each do |j|
        if self[i..j] == self[i..j].reverse && self[i..j].length > 1
          result << self[i..j]
        end
      end
    end
    result
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= Proc.new { |a, b| a <=> b }
    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private

  def self.merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == -1
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end
end
