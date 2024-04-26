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
# @return {Integer}
def max_depth(root)
  max_depth_helper(root)
end

def max_depth_helper(root, depth = 0)
  return depth unless root

  left_depth = max_depth_helper(root.left, depth + 1)
  right_depth = max_depth_helper(root.right, depth + 1)

  [left_depth, right_depth].max
end
