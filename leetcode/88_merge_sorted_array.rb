# You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n,
# representing the number of elements in nums1 and nums2 respectively.
#
# Merge nums1 and nums2 into a single array sorted in non-decreasing order.
# The final sorted array should not be returned by the function, but instead be stored inside the array nums1.
# To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged,
# and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

# Start from the end to avoid overwriting values in nums1.
# At each step, compare nums1[p1] and nums2[p2]. Place the larger at nums1[p].
# Decrement the respective pointers.
# If any elements remain in nums2, they are copied to the front of nums1.
def merge(nums1, m, nums2, n)
  p1 = m - 1
  p2 = n - 1
  p = m + n - 1

  while p2 >= 0
    if p1 >= 0 && nums1[p1] > nums2[p2]
      nums1[p] = nums1[p1]
      p1 -= 1
    else
      nums1[p] = nums2[p2]
      p2 -= 1
    end
    p -= 1
  end
end

nums1 = [1, 2, 3, 0, 0, 0]
m = 3
nums2 = [2, 5, 6]
n = 3
merge(nums1, m, nums2, n)
puts nums1.inspect # Output: [1,2,2,3,5,6]
