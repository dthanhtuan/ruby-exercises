graph = {
  'A' => ['B', 'C'],
  'B' => ['D', 'E'],
  'C' => ['F'],
  'D' => ['G'],
  'E' => ['F', 'G'],
  'F' => ['H'],
  'G' => ['B', 'H'], # Cycle back to B
  'H' => ['I', 'J'],
  'I' => ['J'],
  'J' => [],
  'K' => ['L'], # Disconnected component
  'L' => ['M'],
  'M' => ['K'] # Cyclic component
}

def bfs_search(graph, start_node)
  queue = []
  visited = Set.new
  queue << start_node unless start_node.empty?

  until queue.empty?
    node = queue.shift
    next if node.nil? || node.empty?

    puts node
    graph[node].each do |neighbor|
      next if visited.include?(neighbor)

      visited << neighbor
      queue << neighbor
    end
  end
end

bfs_search(graph, 'A')
