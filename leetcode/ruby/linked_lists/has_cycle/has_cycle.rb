# Definition for singly-linked list.
CYCLE_VALUE = 'CYCLE'

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
  return false unless head

  current_head = head

  until current_head.next.nil?
    return true if current_head.next.val == CYCLE_VALUE

    temp_next = current_head.next
    current_head.next = ListNode.new(CYCLE_VALUE)
    current_head = temp_next
  end

  false
end
