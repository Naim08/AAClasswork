require_relative 'tree_node.rb'

class KnightPathFinder

  attr_reader :start_pos, :considered_positions, :root_node
  def self.valid_moves(pos)
    x, y = pos
    moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    all_moves = moves.map {|move|  [x + move[0], y + move[1]]}
    all_moves.select {|move| move[0].between?(0,7) && move[1].between?(0,7) }
  end
  def initialize(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree
  end

  def new_move_positions(pos)
     moves = KnightPathFinder.valid_moves(pos)
     moves.select do |move|
      if !considered_positions.include?(move)
        considered_positions << move
      end
    end
  end

  def build_move_tree
    queue = [root_node]

    until queue.empty?
      current_node = queue.shift

      new_move_positions(current_node.value).each do |move|
        child = PolyTreeNode.new(move)
        current_node.add_child(child)
        queue << child
      end
    end
  end

  def find_path(pos)
    end_node = root_node.dfs(pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    result = [end_node.value]
    while end_node.value != root_node.value
      end_node = end_node.parent
      result << end_node.value
    end
    result.reverse
  end
end





knight = KnightPathFinder.new([0,0])
p knight.find_path([7,6])





























# class KnightPathFinder
#   attr_reader :root_node, :considered_positions

#   def self.valid_moves(pos)
#     x, y = pos
#     moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
#     moves.map { |dx, dy| [x + dx, y + dy] }
#          .select { |row, col| row.between?(0, 7) && col.between?(0, 7) }
#   end

#   def initialize(start_pos)
#     @start_pos = start_pos
#     @root_node = PolyTreeNode.new(start_pos)
#     @considered_positions = [start_pos]
#     build_move_tree
#   end

#   def find_path(end_pos)
#     end_node = root_node.dfs(end_pos)
#     trace_path_back(end_node)
#   end

#   private

#   def build_move_tree
#     queue = [root_node]

#     until queue.empty?
#       current_node = queue.shift
#       current_pos = current_node.value

#       new_move_positions(current_pos).each do |next_pos|
#         next_node = PolyTreeNode.new(next_pos)
#         current_node.add_child(next_node)
#         queue << next_node
#       end
#     end
#   end

#   def new_move_positions(pos)
#     KnightPathFinder.valid_moves(pos)
#                       .reject { |new_pos| considered_positions.include?(new_pos) }
#                       .each { |new_pos| considered_positions << new_pos }
#   end

#   def trace_path_back(end_node)
#     path = [end_node.value]

#     until path.first == @start_pos
#       path.unshift(end_node.parent.value)
#       end_node = end_node.parent
#     end

#     path
#   end
# end

# kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([6, 2])
