# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  return false unless head && head.next

  slow_pointer = head
  fast_pointer = head

  while fast_pointer && fast_pointer.next
    slow_pointer = slow_pointer.next
    fast_pointer = fast_pointer.next.next

    return true if slow_pointer == fast_pointer
  end

  false
end
