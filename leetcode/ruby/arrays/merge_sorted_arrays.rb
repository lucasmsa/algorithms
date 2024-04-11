# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
# O(m + n) Time complexity | O(1) Space complexity
def merge(nums1, m, nums2, n)
  return unless nums1 && nums2

  nums1_index = m - 1
  nums2_index = n - 1

  iterator_index = m + n - 1

  while iterator_index >= 0
    if nums1_index < 0
      nums1[iterator_index] = nums2[nums2_index]
      nums2_index -= 1
    elsif nums2_index < 0
      break
    elsif nums2[nums2_index] > nums1[nums1_index]
      nums1[iterator_index] = nums2[nums2_index]
      nums2_index -= 1
    elsif nums1[nums1_index] >= nums2[nums2_index]
      nums1[iterator_index] = nums1[nums1_index]
      nums1_index -= 1
    end

    iterator_index -= 1
  end
end
