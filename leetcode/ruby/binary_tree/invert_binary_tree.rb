# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  invert_tree_helper(root)
end

def invert_tree_helper(root)
  return nil unless root

  temp_root = root.clone

  temp_root.left = invert_tree_helper(root.right)
  temp_root.right = invert_tree_helper(root.left)

  temp_root
end
