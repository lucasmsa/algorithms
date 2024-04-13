# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  numbers_to_indexes = {}

  nums.each_with_index do |number, index|
    if numbers_to_indexes.key?(number)
      numbers_to_indexes[number] << index

      return true if contains_combination_with_difference_smaller_than_k(numbers_to_indexes[number], k)
    else
      numbers_to_indexes[number] = [index]
    end
  end

  false
end

def contains_combination_with_difference_smaller_than_k(array, k)
  (0...array.length - 1).each do |iterator|
    current_index = array[iterator]
    next_index = array[iterator + 1]

    return true if (current_index - next_index).abs <= k
  end

  false
end
