# Given the root of a binary tree, return the postorder traversal of its nodes' values.

def postorder_traversal(root)
  result = []
  traverse = lambda do |node|
    return if node.nil?

    traverse.call(node.left)
    traverse.call(node.right)
    result << node.val
  end
  traverse.call(root)
  result
end
