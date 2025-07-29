# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
# Note that you must do this in-place without making a copy of the array.

# How It Works
# Traverse the array, copying each non-zero element to the front (at index non_zero_pos), incrementing non_zero_pos each time.
# After all non-zeros have been moved, fill the remaining positions in the array with zeros.
# This ensures all non-zeros are at the front in their original order, and all zeros are at the end.

def move_zeroes(nums)
  non_zero_pos = 0

  # Move all non-zero elements to the front
  nums.each do |num|
    if num != 0
      nums[non_zero_pos] = num
      non_zero_pos += 1
    end
  end

  # Fill the rest with zeros
  (non_zero_pos...nums.length).each do |i|
    nums[i] = 0
  end
end

nums = [0, 1, 0, 3, 12]
move_zeroes(nums)
puts nums.inspect  # Output: [1, 3, 12, 0, 0]
