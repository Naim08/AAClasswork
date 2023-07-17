# class PolyTreeNode
#   attr_reader :value, :parent, :children

#   def initialize(value)
#     @value = value
#     @parent = nil
#     @children = []
#   end

#   def parent=(node)
#     return if @parent == node

#     if @parent
#       @parent.children.delete(self)
#     end

#     @parent = node

#     if node
#       node.children << self unless node.children.include?(self)
#     end
#   end

#   def add_child(child_node)
#     child_node.parent = self
#   end

#   def remove_child(child_node)
#     raise "Node is not a child" unless @children.include?(child_node)

#     child_node.parent = nil
#   end

#   def dfs(target_value)
#     return self if @value == target_value

#     @children.each do |child|
#       result = child.dfs(target_value)
#       return result if result
#     end

#     nil
#   end

#   def bfs(target_value)
#     queue = [self]

#     until queue.empty?
#       node = queue.shift
#       return node if node.value == target_value

#       node.children.each do |child|
#         queue << child
#       end
#     end

#     nil
#   end
# end
# # n1 = PolyTreeNode.new("root1")
# # n2 = PolyTreeNode.new("root2")
# # n3 = PolyTreeNode.new("root3")

# # # connect n3 to n1
# # n3.parent = n1
# # # connect n3 to n2
# # n3.parent = n2

# # # this should work
# # raise "Bad parent=!" unless n3.parent == n2
# # raise "Bad parent=!" unless n2.children == [n3]


class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) if @parent
    @parent = node
    @parent.children << self if node
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child" unless @children.include?(child_node)

    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value

    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value

      node.children.each do |child|
        queue << child
      end
    end

    nil
  end
end
