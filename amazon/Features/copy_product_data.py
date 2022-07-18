from typing import List, Optional


class LinkedList:
    def __init__(self, prod, next=None, related=None):
        self.prod = prod
        self.next = next
        self.related = related


# O(n) Time | O(n) Space
def create_list(linked_list_values: List[int], linked_list_pointers: List[int]):
    related_nodes, idx = {}, 0

    while idx < len(linked_list_values):
        related_pointer_idx = linked_list_pointers[idx]

        if related_pointer_idx and related_pointer_idx not in related_nodes:
            related_nodes[related_pointer_idx] = LinkedList(
                linked_list_values[related_pointer_idx], None, None)

        if idx not in related_nodes:
            related_nodes[idx] = LinkedList(
                linked_list_values[idx], None, None)

        if idx > 0:
            related_nodes[idx - 1].next = related_nodes[idx]

        related_nodes[idx].related = related_nodes[related_pointer_idx] if related_pointer_idx in related_nodes else None

        idx += 1

    return related_nodes[0]


# O(n) Time | O(n) Space
def copy_product_relations(head: Optional[LinkedList]):
    if not head:
        return None

    nodes = {}

    def get_cloned_node(node):
        if node:
            if node not in nodes:
                nodes[node] = LinkedList(node.prod, None, None)
            return nodes[node]
        return None

    original_list_node = head
    new_node = LinkedList(original_list_node.prod, None, None)
    nodes[original_list_node] = new_node

    while original_list_node:
        new_node.related = get_cloned_node(original_list_node.related)
        new_node.next = get_cloned_node(original_list_node.next)

        original_list_node = original_list_node.next
        new_node = new_node.next

    return nodes[head]


head = create_list([3, 1, 5, 4], [2, 0, None, 1])

copy_product_relations(head)
