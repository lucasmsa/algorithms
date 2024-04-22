# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  return if !list1 && !list2

  current_head1 = list1
  current_head2 = list2

  current_node = ListNode.new
  pre_node = current_node

  while current_head1 && current_head2
    if current_head1.val < current_head2.val
      current_node.next = current_head1
      current_head1 = current_head1.next
    else
      current_node.next = current_head2
      current_head2 = current_head2.next
    end

    current_node = current_node.next
  end

  current_node.next = current_head1 || current_head2

  pre_node.next
end
