# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  is_same_tree_helper(p, q)
end

def is_same_tree_helper(p, q)
  no_tree_exists = !p && !q
  one_of_the_trees_does_not_exist = ((!p && q) || (p && !q))
  tree_exists_and_values_differ = ((p && q) && (p.val != q.val))

  if tree_exists_and_values_differ || one_of_the_trees_does_not_exist
    return false
  elsif no_tree_exists
    return true
  end

  left_is_the_same = is_same_tree_helper(p.left, q.left)
  right_is_the_same = is_same_tree_helper(p.right, q.right)

  left_is_the_same && right_is_the_same
end
