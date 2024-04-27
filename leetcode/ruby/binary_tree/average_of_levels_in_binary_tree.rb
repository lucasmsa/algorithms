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
# @return {Float[]}
def average_of_levels(root)
  return unless root

  stack = [root]
  levels_mean = [root.val]

  until stack.empty?
    level_stack = []
    current_mean = 0
    amount_of_nodes_on_level = 0

    until stack.empty?
      popped_node = stack.pop

      level_stack << popped_node.left if popped_node.left
      level_stack << popped_node.right if popped_node.right
    end

    until level_stack.empty?
      popped_node = level_stack.pop
      stack << popped_node

      amount_of_nodes_on_level += 1
      current_mean += popped_node.val
    end

    if amount_of_nodes_on_level.positive?
      current_mean = current_mean.fdiv(amount_of_nodes_on_level)
      levels_mean << current_mean
    end
  end

  levels_mean
end
