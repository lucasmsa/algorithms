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
  return false unless root

  visited = Set.new([])
  paths_sum = Set.new([])

  depth_first_search(visited, root, target_sum, paths_sum, 0)
  paths_sum.include?(target_sum)
end

def depth_first_search(visited, root, target_sum, paths_sum, path_sum = 0)
  return if visited.include?(root)

  visited.add(root)
  path_sum += root.val
  is_leaf = !root.left && !root.right

  if is_leaf
    paths_sum.add(path_sum) if path_sum == target_sum
  else
    children = [root.left, root.right]
    children.each do |child|
      depth_first_search(visited, child, target_sum, paths_sum, path_sum) if child
    end
  end
end
