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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  has_path_sum_helper(root, target_sum, 0)
end

def has_path_sum_helper(root, target_sum, path_sum)
  return false unless root

  path_sum += root.val
  is_leaf = !root.left && !root.right
  return path_sum == target_sum if is_leaf

  left_side_contains_target_sum = has_path_sum_helper(root.left, target_sum, path_sum)
  right_side_contains_target_sum = has_path_sum_helper(root.right, target_sum, path_sum)

  left_side_contains_target_sum || right_side_contains_target_sum
end
