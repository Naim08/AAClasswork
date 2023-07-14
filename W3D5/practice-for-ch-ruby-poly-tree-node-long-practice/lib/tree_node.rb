class MyQueue  
  def initialize
      @inner_array = []
  end

  def enqueue(el)
      inner_array.push(el)
      # inner_array.unshift(el)
    #   show
      self
  end

  def dequeue
      inner_array.shift
      # inner_array.pop
  end

  def show
      inner_array.dup
  end

  def empty?
      inner_array.empty?
  end

  private
  attr_reader :inner_array
end


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

  def dfs(target)
   return self if self.value == target

  self.children.each do |child|
    result = child.dfs(target)
    return result if !result.nil?
  end

  nil
  end

  def bfs(target)
    queue = MyQueue.new
    queue.enqueue(self)
    while !queue.empty?
      removed_node = queue.dequeue
      if removed_node.value == target 
        return removed_node
      else
        removed_node.children.each do |child|
          queue.enqueue(child)
        end
      end
    end
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
