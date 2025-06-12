# Given an integer array nums, return the third distinct maximum number in this array.
# If the third maximum does not exist, return the maximum number.

# Explanation
# We keep track of the top three distinct maximum values: first, second, and third.
# For every number in the array:
# # Skip it if it's already one of the three maximums (to ensure distinctness).
# # Update the top three maximums accordingly.
# At the end, if the third maximum (third) is still nil, it means there aren't three distinct numbers, so return the maximum (first). Otherwise, return third.
def third_max(nums)
  first = second = third = nil

  nums.each do |num|
    next if num == first || num == second || num == third

    if first.nil? || num > first
      third = second
      second = first
      first = num
    elsif second.nil? || num > second
      third = second
      second = num
    elsif third.nil? || num > third
      third = num
    end
  end

  third.nil? ? first : third
end
