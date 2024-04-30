# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  result = 0
  nums.each do |number|
    result ^= number
  end

  result
end
