require_relative 'tree_node'

class KnightPathFinder
  MOVES = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [1, -2],
    [1, 2],
    [2, -1],
    [2, 1]
  ].freeze

  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree
  end

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

  private

  def self.valid_moves(pos)
    row, col = pos
    moves = MOVES.map { |dx, dy| [row + dx, col + dy] }
    moves.select { |pos| pos.all? { |coord| coord.between?(0, 7) } }
  end

  def new_move_positions(pos)
    self.class.valid_moves(pos).reject { |new_pos| @considered_positions.include?(new_pos) }
                                .each { |new_pos| @considered_positions << new_pos }
  end

  # def build_move_tree
  #   queue = [@root_node]

  #   until queue.empty?
  #     node = queue.shift
  #     current_pos = node.value

  #     new_move_positions(current_pos).each do |new_pos|
  #       new_node = PolyTreeNode.new(new_pos)
  #       node.add_child(new_node)
  #       queue << new_node
  #     end
  #   end
  # end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      node = queue.shift
      current_pos = node.value

      new_move_positions(current_pos).each do |new_pos|
        new_node = PolyTreeNode.new(new_pos)
        new_node.parent = node # set parent node
        node.add_child(new_node)
        queue << new_node
      end
    end
  end

  def trace_path_back(end_node)
    path = [end_node.value]

    until path.first == @start_pos
      path.unshift(end_node.parent.value)
      end_node = end_node.parent
    end

    path
  end
end


kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

# n can be negative
#
def exponent(b,n)
  return 1 if n == 0
  return b if n == 1

 result = b * exponent(b, n.abs - 1)
 if n < 0
  p result
   1 / (result * 1.0)
 else
   result
 end
end

p exponent(2, 3) # => 8
p exponent(2, -4) # => 16

def fib_sum(n)
  return 0 if n == 0
  return 1 if n == 1

  fib_sum(n - 1) + fib_sum(n - 2) + 1
end

p fib_sum(6)

def symmetic_substrigs(str)
  substrings = []
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      substrings << str[i..j]
    end
  end

  p substrings
  substrings.select { |substr| substr == substr.reverse && substr.length > 1 }

end

p symmetic_substrigs("coolo") # => ["oo"]

class Array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self

  end

  def my_all?(&prc)
    my_each do |el|
      return false unless prc.call(el)
    end
    true
  end
end
