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
  return 0 if !l1 && !l2

  sum_list = ListNode.new
  pre_sum = ListNode.new

  pre_sum.next = sum_list

  one_up = 0

  while l1 && l2
    sum = l1.val + l2.val + one_up
    one_up = 0

    one_up = sum / 10
    carry = sum % 10

    sum_list.next = ListNode.new(carry)
    sum_list = sum_list.next

    l1 = l1.next
    l2 = l2.next
  end

  while l1
    sum = l1.val + one_up
    one_up = 0

    one_up = sum / 10
    carry = sum % 10

    sum_list.next = ListNode.new(carry)
    sum_list = sum_list.next

    l1 = l1.next
  end

  while l2
    sum = l2.val + one_up
    one_up = 0

    one_up = sum / 10
    carry = sum % 10

    sum_list.next = ListNode.new(carry)

    sum_list = sum_list.next
    l2 = l2.next
  end

  sum_list.next = ListNode.new(one_up) if one_up > 0

  pre_sum.next.next
end
