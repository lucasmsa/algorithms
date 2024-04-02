# Description on Notion

from typing import List


class LinkedListNode:
    def __init__(self, data):
        self.data = data
        self.next = None
        self.prev = None
        self.arbitrary = None


def insert_at_head(head, data):
    new_node = LinkedListNode(data)
    new_node.next = head
    return new_node


def display(head):
    temp = head
    while temp:
        print(f"({str(temp.data)})", end="")
        temp = temp.next
        if temp != None:
            print(" -> ", end="")


def create_linked_list(lst):
    list_head = None
    for x in reversed(lst):
        list_head = insert_at_head(list_head, x)
    return list_head


# Exercise
def fetch_top_movies(linked_lists: List[LinkedListNode]):
    if not len(linked_lists):
        return None
    if len(linked_lists) == 1:
        return linked_lists[0]

    current_top_movies = merge_two_linked_lists(
        linked_lists[0], linked_lists[1])

    idx = 2
    while idx < len(linked_lists):
        current_top_movies = merge_two_linked_lists(
            current_top_movies, linked_lists[idx])
        idx += 1

    return current_top_movies


# O(n * k) Time | O(1) Space
# n is the maximum size of a single list
# k is the number lists
def merge_two_linked_lists(l1: LinkedListNode, l2: LinkedListNode):
    pre_head = LinkedListNode(-1)
    pointer = pre_head

    while l1 and l2:
        if l1.data < l2.data:
            pointer.next = l1
            l1 = l1.next
        else:
            pointer.next = l2
            l2 = l2.next

        pointer = pointer.next

    pointer.next = l1 or l2

    return pre_head.next


# Driver code
a = create_linked_list([11, 41, 51])
b = create_linked_list([21, 23, 42])
c = create_linked_list([25, 56, 66, 72])

print("All movie ID's from best to worse are:")
display(fetch_top_movies([a, b, c]))
