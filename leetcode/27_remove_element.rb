# Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
# The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.
#
# Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:
#
# Change the array nums such that the first k elements of nums contain the elements which are not equal to val.
# The remaining elements of nums are not important as well as the size of nums.
# Return k.

# This problem is efficiently solved using the two-pointer technique:
# Use one pointer (i) to iterate through the array.
# Use another pointer (k) to track the position to write the next non-val element.
# For each element in nums, if it is not equal to val, assign it to nums[k] and increment k.
# After the loop, k will be the new length, and the first k elements of nums will be the elements not equal to val
def remove_element(nums, val)
  k = 0
  nums.each do |num|
    if num != val
      nums[k] = num
      k += 1
    end
  end
  k
end

nums = [3, 2, 2, 3]
val = 3
length = remove_element(nums, val)
puts length # Output: 2
puts nums[0...length] # Output: [2, 2]
