# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  indexes_map = {}

  nums.each_with_index do |number, index|
    complement = target - number

    return [indexes_map[complement], index] if indexes_map.key?(complement)

    indexes_map[number] = index
  end
end
