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
