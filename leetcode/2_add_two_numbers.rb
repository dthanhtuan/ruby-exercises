# https://leetcode.com/problems/add-two-numbers/description/
# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order, and each of their nodes contains a single digit.
# Add the two numbers and return the sum as a linked list.
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.
#
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  dummy_head = ListNode.new(0)
  current = dummy_head
  carry = 0

  while l1 || l2 || carry != 0
    val1 = l1 ? l1.val : 0
    val2 = l2 ? l2.val : 0
    sum = val1 + val2 + carry
    carry = sum / 10
    current.next = ListNode.new(sum % 10)
    current = current.next

    l1 = l1.next if l1
    l2 = l2.next if l2
  end

  dummy_head.next
end
