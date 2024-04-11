# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# O(logn) Time complexity | O(1) Space complexity
def search_insert(nums, target)
  left = 0
  right = nums.length - 1

  while true
    middle = (left + right).div(2)

    if left > right
      return left
    elsif target == nums[middle]
      return middle
    end

    if target > nums[middle]
      left = middle + 1
    else
      right = middle - 1
    end
  end
end
