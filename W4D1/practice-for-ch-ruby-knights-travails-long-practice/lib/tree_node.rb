class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if self.parent == node

    if self.parent
      self.parent.children.delete(self)
    end

    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child" unless self.children.include?(child_node)

    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue.concat(node.children)
    end
  end
end
