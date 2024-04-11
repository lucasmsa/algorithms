# @param {Integer[]} nums
# @return {Integer}
# O(n) Time complexity | O(1) Space complexity
def remove_duplicates(nums)
  return 0 if nums.empty?

  index_of_unique_numbers = 1

  (1...nums.length).each do |index|
    current_number = nums[index]
    last_number = nums[index - 1]

    if current_number != last_number
      nums[index_of_unique_numbers] = current_number
      index_of_unique_numbers += 1
    end
  end

  index_of_unique_numbers
end
