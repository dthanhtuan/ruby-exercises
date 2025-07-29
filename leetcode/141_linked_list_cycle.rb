# Given head, the head of a linked list, determine if the linked list has a cycle in it.
#
# There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.
# Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
#
# Return true if there is a cycle in the linked list. Otherwise, return false.

# How it works:
#
# If there is no cycle, the fast pointer will reach the end (nil) first.
# If there is a cycle, the fast pointer will eventually "lap" the slow pointer, and they will meet at some node within the cycle

def has_cycle(head)
  slow = fast = head
  while fast&.next
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end
  false
end
