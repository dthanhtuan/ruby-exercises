# You are given the head of a singly linked-list. The list can be represented as:
# L0 → L1 → … → Ln - 1 → Ln
# Reorder the list to be on the following form:
# L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
#
# You may not modify the values in the list's nodes. Only nodes themselves may be changed.

# Given: 1 → 2 → 3 → 4 → 5
# After reorder: 1 → 5 → 2 → 4 → 3
# Find the Middle
# Use slow/fast pointers to split the list into two halves:
### First half: 1 → 2 → 3
### Second half: 4 → 5
#
# 2. Reverse the Second Half
# Reverse 4 → 5 to get 5 → 4.
#
# 3. Merge Alternately
# Interleave nodes from the first half (1 → 2 → 3) and reversed second half (5 → 4):
#
# 1 → 5 → 2 → 4 → 3.

# Step 1: Find the Middle
# Use the slow and fast pointer technique to find the middle node.
#
# Step 2: Reverse the Second Half
# Reverse the list starting from the node after the middle.
#
# Step 3: Merge Two Halves
# Alternately merge nodes from the first and reversed second half.

def reorder_list(head)
  return if head.nil? || head.next.nil?

  # Step 1: Find the middle
  slow = fast = head
  while fast&.next
    slow = slow.next
    fast = fast.next.next
  end

  # Step 2: Reverse the second half
  prev = nil
  curr = slow.next
  slow.next = nil # Split the list
  while curr
    nxt = curr.next
    curr.next = prev
    prev = curr
    curr = nxt
  end
  second = prev

  # Step 3: Merge two halves
  first = head
  while second
    tmp1 = first.next
    tmp2 = second.next

    first.next = second
    second.next = tmp1

    first = tmp1
    second = tmp2
  end
end
