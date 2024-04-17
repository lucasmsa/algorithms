# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  return [] if nums.empty?

  all_ranges = []
  current_range = []

  nums.each_with_index do |number, index|
    if index == nums.length - 1
      current_range << if current_range.empty?
                         "#{number}"
                       else
                         number
                       end

      all_ranges << current_range.join
    elsif current_range.length && nums[index + 1] != number + 1
      current_range << number
      all_ranges << current_range.join
      current_range = []
    elsif current_range.empty? && nums[index + 1] == number + 1
      current_range << "#{number}->"
    end
  end

  all_ranges
end
