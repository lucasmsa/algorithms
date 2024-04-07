# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  nums.sort!

  index = 0
  while index < nums.length
    number = nums[index]

    return number unless number == nums[index + 1]

    index += 2

  end
end
