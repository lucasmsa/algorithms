# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?
  return nums[0] if nums.length < 2

  first_two_houses_sum = [nums[0], [nums[0], nums[1]].max]
  total_rob_sum = first_two_houses_sum

  (2...nums.length).each do |index|
    number = nums[index]

    total_rob_sum << [number + total_rob_sum[index - 2], total_rob_sum[index - 1]].max
  end

  total_rob_sum.last
end
