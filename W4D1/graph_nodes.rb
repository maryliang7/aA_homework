require "set"

class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end
end

def bfs(starting_node, target_value)
    line = []
    visited = Set.new()
    line << starting_node

    until line.empty?
        current = line.shift
        return current if current.value == target_value

        current.neighbors.each do |node|
            if visited.add?(node)
                line << node
            end
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
