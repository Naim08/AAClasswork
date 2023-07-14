class PolyTreeNode
  attr_reader :children, :parent, :value
  def initialize(value = "new_node", parent = nil)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(node)
    if !@parent.nil?
      @parent.children.delete(self)
    end
    
    @parent = node
    return self if node.nil? 
    if !node.children.include?(self) 
      node.children << self
    end
  end

  def inspect 
    "#{@value}"
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise 'error' if !@children.include?(node)
    node.parent = nil
  end

  def dfs(value)
    
  end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]
