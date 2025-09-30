# frozen_string_literal: true

# Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
# Example 1:
#   Input: nums = [0,1]
#   Output: 2
#   Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
# Example 2:
#   Input: nums = [0,1,0]
#   Output: 2
#   Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
# Example 3:
#   Input: nums = [0,1,1,1,1,1,0,0,0]
#   Output: 6
#   Explanation: [1,1,1,0,0,0] is the longest contiguous subarray with equal number of 0 and 1.

def find_max_length(nums)
  prefix_sum_index = { 0 => -1 }
  max_length = 0
  prefix_sum = 0
  last_match_index = -1

  nums.each_with_index do |num, index|
    prefix_sum += (num.zero? ? -1 : 1)
    if prefix_sum_index.key?(prefix_sum)
      max_length = [max_length, index - prefix_sum_index[prefix_sum]].max
      last_match_index = index
    else
      prefix_sum_index[prefix_sum] = index
    end
  end
  puts "max_length: #{max_length}"
  puts "Subarray: #{nums[(last_match_index - max_length + 1)..last_match_index]}"
end

find_max_length([0, 1, 1, 1, 1, 1, 0, 0, 0])
