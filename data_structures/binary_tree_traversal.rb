# frozen_string_literal: true
class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :traveled_nodes

  def initialize(root = nil)
    @root = root
    @traveled_nodes = []
  end

  def inorder_traversal(node = @root)
    return if node.nil?

    inorder_traversal(node.left)
    traveled_nodes << node.value
    inorder_traversal(node.right)
  end

  def post_order_traversal(node = @root)
    return if node.nil?

    post_order_traversal(node.left)
    post_order_traversal(node.right)
    traveled_nodes << node.value
  end

  def pre_order_traversal(node = @root)
    return if node.nil?

    traveled_nodes << node.value
    pre_order_traversal(node.left)
    pre_order_traversal(node.right)
  end

  def level_order_traversal(node = @root)
    return if node.nil?

    queue = [node]
    until queue.empty?
      current_node = queue.shift
      traveled_nodes << current_node.value

      queue << current_node.left if current_node.left
      queue << current_node.right if current_node.right
    end
  end

  def print_traveled_nodes
    puts 'Inorder Traversal: '
    inorder_traversal
    puts traveled_nodes.join(' ')

    @traveled_nodes.clear

    puts 'Post Order Traversal: '
    post_order_traversal
    puts traveled_nodes.join(' ')

    @traveled_nodes.clear

    puts 'Pre Order Traversal: '
    pre_order_traversal
    puts traveled_nodes.join(' ')

    @traveled_nodes.clear

    puts 'Level Order Traversal: '
    level_order_traversal
    puts traveled_nodes.join(' ')
  end
end



root = TreeNode.new(10)
root.left = TreeNode.new(5)
root.right = TreeNode.new(14)
root.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(6)

tree = BinaryTree.new(root)
tree.print_traveled_nodes
