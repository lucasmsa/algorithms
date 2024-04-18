# @param {Integer[]} nums
# @return {Integer}

# O(nlogn) Time | O(1) Space
def majority_element(nums)
  return if nums.empty?

  nums.sort!

  current = {
    'number' => nums[0],
    'frequency' => 1
  }

  largest = current.clone

  (1...nums.length).each do |index|
    number = nums[index]

    if number == current['number']
      current['frequency'] += 1
    else
      largest = get_largest_frequency(current, largest)
      current['number'] = number
      current['frequency'] = 1
    end
  end

  get_largest_frequency(current, largest)['number']
end

def get_largest_frequency(current, largest)
  if current['frequency'] > largest['frequency']
    largest['number'] = current['number']
    largest['frequency'] = current['frequency']
  end

  largest
end
