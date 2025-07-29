# Given the head of a singly linked list and two integers left and right where left <= right,
# reverse the nodes of the list from position left to position right, and return the reversed list.

# How this works:
# Move pre to the node just before the section to reverse.
# Reverse in-place:
# # For each node in the reversal section, remove it from its current position and insert it immediately after pre.
# Return:
# The head of the new list is dummy.next.

# Initial Setup
# #Dummy node: → 1 → 2 → 3 → 4 → 5
# #pre starts at the dummy node.
# #Goal: Reverse nodes 2 → 3 → 4 to get 1 → 4 → 3 → 2 → 5.
# Step 1: Move pre to Position 1
# # Move pre forward left - 1 = 1 time: pre is now at node 1.
# # Current state:
# # → 1(pre) → 2 → 3 → 4 → 5
# Step 2: Reverse the Sublist (2 → 3 → 4)
# Initialization
# curr = pre.next = 2
#
# First Iteration (Reversing 2 → 3)
# temp = curr.next → 3
# curr.next = temp.next → 2.next = 4
# temp.next = pre.next → 3.next = 2
# pre.next = temp → 1.next = 3
# Result after first iteration:
# → 1 → 3 → 2 → 4 → 5
#
# Second Iteration (Reversing 3 → 4)
# temp = curr.next → 4 (curr is still at 2)
# curr.next = temp.next → 2.next = 5
# temp.next = pre.next → 4.next = 3
# pre.next = temp → 1.next = 4
# Result after second iteration:
# → 1 → 4 → 3 → 2 → 5
def reverse_between(head, left, right)
  return head if left == right

  dummy = ListNode.new(0)
  dummy.next = head
  pre = dummy

  # Step 1: Move pre to one node before the reversal section
  (left - 1).times { pre = pre.next }

  # Step 2: Reverse the sublist between left and right
  curr = pre.next
  (right - left).times do
    temp = curr.next
    curr.next = temp.next
    temp.next = pre.next
    pre.next = temp
  end

  dummy.next
end
