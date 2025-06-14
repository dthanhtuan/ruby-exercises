# Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.
#
# There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.
# Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed).
# It is -1 if there is no cycle. Note that pos is not passed as a parameter.
#
# Do not modify the linked list.



def detect_cycle(head)
  slow = fast = head

  # Phase 1: Detect if a cycle exists
  while fast&.next
    slow = slow.next
    fast = fast.next.next
    break if slow == fast
  end

  # No cycle found
  return nil unless fast&.next

  # Phase 2: Find the entry point of the cycle
  start = head
  while start != slow
    start = start.next
    slow = slow.next
  end

  start
end
