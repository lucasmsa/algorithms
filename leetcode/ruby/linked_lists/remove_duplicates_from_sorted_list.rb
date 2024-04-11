# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @return {ListNode}
# O(n) Time complexity | O(1) Space complexity
def delete_duplicates(head)
  current_head = head

  while current_head
    if current_head.next
      non_repeated_element = current_head

      while non_repeated_element.next && non_repeated_element.next.val == non_repeated_element.val
        non_repeated_element = non_repeated_element.next
      end

      current_head.next = non_repeated_element.next
      current_head = non_repeated_element.next
    else
      current_head = current_head.next
    end
  end

  head
end
