# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  digits = {}
  nums.each do |number|
    if digits.key?(number)
      digits[number] += 1
    else
      digits[number] = 1
    end
  end

  digits.each do |number, quantity|
    return number if quantity == 1
  end
end