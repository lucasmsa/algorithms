# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  candidate = 0
  votes = 0

  nums.each do |number|
    candidate = number if votes == 0

    if number == candidate
      votes += 1
    else
      votes -= 1
    end
  end

  candidate
end
