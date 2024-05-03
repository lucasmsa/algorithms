# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  sliding_window_index = 0
  current_number = nums.first
  current_number_quantity = 1

  index = 0
  while index < nums.length
    number = nums[index]
    if current_number != number
      current_number = number
      current_number_quantity = 1
    end

    if current_number_quantity <= 2
      nums[sliding_window_index] = current_number
      current_number_quantity += 1
      sliding_window_index += 1
    end

    index += 1
  end

  sliding_window_index
end
