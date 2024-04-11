# O(n) Time complexity | O(1) Space complexity
def remove_element(nums, val)
  number_of_non_val_values = 0
  index_of_filtered_array = 0

  nums.each_index do |index|
    number = nums[index]
    next unless number != val

    nums[index_of_filtered_array] = nums[index]
    index_of_filtered_array += 1
    number_of_non_val_values += 1
  end

  number_of_non_val_values
end
