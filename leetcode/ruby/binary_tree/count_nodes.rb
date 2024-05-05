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
def count_nodes(root)
  return 0 unless root

  stack = [root]
  number_of_nodes = 0

  until stack.empty?
    level_stack = []
    until stack.empty?
      last_node = stack.pop
      number_of_nodes += 1

      level_stack << last_node.left if last_node.left
      level_stack << last_node.right if last_node.right
    end

    until level_stack.empty?
      last_node = level_stack.pop
      number_of_nodes += 1

      stack << last_node.left if last_node.left
      stack << last_node.right if last_node.right
    end
  end

  number_of_nodes
end
