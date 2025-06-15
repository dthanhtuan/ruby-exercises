class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, nxt = nil)
    @val = val
    @next = nxt
  end
end

def merge_sort(head)
  return head if head.nil? || head.next.nil?

  # Find the middle using slow and fast pointers
  slow = head
  fast = head
  prev = nil

  while fast && fast.next
    prev = slow
    slow = slow.next
    fast = fast.next.next
  end

  # Split the list into two halves
  prev.next = nil

  # Recursively sort each half
  left = merge_sort(head)
  right = merge_sort(slow)

  # Merge the sorted halves
  merge_two_sorted_lists(left, right)
end

def merge_two_sorted_lists(l1, l2)
  dummy = ListNode.new
  current = dummy

  while l1 && l2
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end

  current.next = l1 || l2
  dummy.next
end
