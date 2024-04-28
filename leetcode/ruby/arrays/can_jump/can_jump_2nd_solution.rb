# @param {Integer[]} nums
# @return {Boolean}
# O(n) Time | O(1) Space
def can_jump(nums)
  goal_position = nums.length - 1

  (0...nums.length - 1).reverse_each do |index|
    goal_position = index if index + nums[index] >= goal_position
  end

  goal_position.zero?
end
