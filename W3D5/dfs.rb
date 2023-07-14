class Node
  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = []
  end

  def inspect
    "#{value} [#{children.map(&:inspect).join(', ')}]"
  end
end
def dfs(node, value)
  p node
  return nil if node.children.nil?
  return node if node.value == value

  node.children.each do |child|

    result = dfs(child, value)
    return result unless result.nil?
  end

  nil
end



def bfs(node, value)
  queue = [node]

  until queue.empty?
    current_node = queue.shift
    p current_node
    return current_node if current_node.value == value
    queue += current_node.children
  end
  nil
end

#test
a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
e = Node.new(5)
f = Node.new(6)
g = Node.new(7)
h = Node.new(8)
i = Node.new(9)

a.children = [b, c, d]
b.children = [e, f]
c.children = [g, h]
d.children = [i]

p dfs(a, 5) == e

p bfs(a, 5) == e
