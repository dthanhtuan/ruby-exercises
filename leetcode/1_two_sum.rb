# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# You can return the answer in any order.

# Initialize an empty hash.
# Iterate over the array with both value and index.
# For each number, compute its complement (target - num).
# If the complement exists in the hash, return the pair of indices.
# Otherwise, store the current number and its index in the hash.
# This approach ensures a time complexity of O(n), which is optimal for this problem
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    complement = target - num
    return [hash[complement], i] if hash.key?(complement)

    hash[num] = i
  end
end

puts two_sum([2, 7, 11, 15], 9).inspect
# Output: [0, 1]
