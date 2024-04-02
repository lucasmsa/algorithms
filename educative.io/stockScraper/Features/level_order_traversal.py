class TreeNode:
    def __init__(self, val):
        self.val = val
        self.children = []


def level_order_traversal(root: TreeNode):
    if not root:
        return None
    traversal = [[root.val]]

    queue = root.children

    while queue:
        current_queue_length = len(queue)
        current_level = []

        for _ in range(current_queue_length):
            popped_element = queue.pop(0)
            current_level.append(popped_element.val)
            queue.extend(popped_element.children)

        traversal.append(current_level)

    return traversal


#        (body)
#       /  |  \
#   (div) (h1) (div)
#   / \         / \
# (h2) (h3)   (a)  (p)

root = TreeNode("body")
root.children.append(TreeNode("div"))
root.children.append(TreeNode("h1"))
root.children.append(TreeNode("div"))
root.children[0].children.append(TreeNode("h2"))
root.children[0].children.append(TreeNode("h3"))
root.children[2].children.append(TreeNode("a"))
root.children[2].children.append(TreeNode("p"))
print(level_order_traversal(root))
