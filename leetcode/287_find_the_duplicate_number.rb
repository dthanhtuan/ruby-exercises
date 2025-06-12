# Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
# There is `only one repeated number` in nums, return this repeated number.
# You must solve the problem without modifying the array nums and using only constant extra space.
# Example 1:
#
# Input: nums = [1,3,4,2,2]
# Output: 2
# Example 2:
#
# Input: nums = [3,1,3,4,2]
# Output: 3
# Example 3:
#
# Input: nums = [3,3,3,3,3]
# Output: 3
#
# Array as a Linked List: Treat each element as a pointer to the next index. For example, nums[i] points to index j = nums[i].
# Duplicate Creates a Cycle: A duplicate value means two different indices point to the same next index, forming a cycle.
def find_duplicate(nums)
  # Phase 1: Finding the intersection point of the two runners.
  # Array as a Linked List: we treat the array as a linked list by using the values stored in the array as pointers to indices:
  ## slow = nums[slow] is equivalent to slow = slow.next in a linked list, meaning the slow pointer moves one step forward.
  ## fast = nums[nums[fast]] is equivalent to fast = fast.next.next in a linked list, meaning the fast pointer moves two steps forward.
  # Initialize slow and fast pointers at the start of the array.
  slow = nums[0]
  fast = nums[0]

  # Move slow pointer by 1 step and fast pointer by 2 steps until they meet.
  # nums[slow] and nums[fast] represent indices
  loop do
    slow = nums[slow]           # Move slow pointer one step
    fast = nums[nums[fast]]     # Move fast pointer two steps
    break if slow == fast       # When they meet, a cycle is detected
  end

  # Phase 2: Find the entrance to the cycle (duplicate number).
  # Start a new pointer from the beginning of the array.
  slow2 = nums[0]

  # Move both pointers one step at a time until they meet.
  # The meeting point is the duplicate number.
  while slow != slow2
    slow = nums[slow]
    slow2 = nums[slow2]
  end

  slow  # Return the duplicate number
end
