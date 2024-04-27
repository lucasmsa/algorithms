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
# @return {Boolean}
def is_symmetric(root)
  is_symmetric_helper(root.left, root.right)
end

def is_symmetric_helper(left, right)
  if !left && !right
    return true
  elsif ((!left && right) || (left && !right)) || (left.val != right.val)
    return false
  end

  left_is_equal = is_symmetric_helper(left.left, right.right)
  right_is_equal = is_symmetric_helper(right.left, left.right)

  left_is_equal && right_is_equal
end
