# iven an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once.
# The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
#
# Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
#
# Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially.
# The remaining elements of nums are not important as well as the size of nums.
# Return k.
# #
# Start with i = 0 (the first unique element).
# Iterate j from 1 to the end of the array.
# Whenever you find a new unique element (nums[j] != nums[i]), increment i and copy nums[j] to nums[i]
# After the loop, the first i + 1 elements of nums are the unique values, and the function returns the new length.
#
# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  i = 0
  (1...nums.length).each do |j|
    if nums[j] != nums[i]
      i += 1
      nums[i] = nums[j]
    end
  end
  i + 1
end
