# Given the root of a binary tree, return the preorder traversal of its nodes' values.

def preorder_traversal(root)
  result = []
  traverse = lambda do |node|
    return if node.nil?

    result << node.val
    traverse.call(node.left)
    traverse.call(node.right)
  end
  traverse.call(root)
  result
end
