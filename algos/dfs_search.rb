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

def dfs_search(graph, node, visited = nil)
  visited ||= Set.new
  visited << node

  puts node
  graph[node].each do |neighbor|
    next if visited.include?(neighbor)

    dfs_search(graph, neighbor, visited)
  end
end

dfs_search(graph, 'A')
