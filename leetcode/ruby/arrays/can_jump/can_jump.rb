# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.empty? || (nums.length == 1 && nums[0].zero?)

  nums.each_with_index do |number, index|
    next unless number.zero?

    current_index = index
    can_jump_after_this_zero = false

    while true
      current_index -= 1
      break if current_index.negative?

      jump_to_index = current_index + nums[current_index]

      if (jump_to_index > index) || (jump_to_index == nums.length - 1)
        can_jump_after_this_zero = true
        break
      end
    end

    return false unless can_jump_after_this_zero
  end

  true
end
