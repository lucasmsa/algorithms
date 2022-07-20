import math


class Stack:
    def __init__(self):
        self.list_stack = []

    def push(self, item):
        self.list_stack.append(item)

    def is_empty(self):
        return len(self.list_stack) == 0

    def top(self):
        if not self.is_empty():
            return self.list_stack[self.size - 1]

    def size(self):
        return len(self.list_stack)

    def pop(self):
        if not self.is_empty():
            return self.list_stack.pop()


# O(1) Time | O(n) Space
class BrowseRatings:
    def __init__(self):
        self.stack = Stack()
        self.max_stack = Stack()

    def push(self, item):
        current_top_value = self.max_stack[-1]
        self.stack.push(item)
        if not len(self.max_stack) or current_top_value < item:
            self.max_stack.push(item)
        else:
            self.max_stack.push(current_top_value)

    def top(self):
        if not self.max_stack.is_empty():
            return self.max_stack[-1]

    def pop(self):
        self.max_stack.pop()
        return self.stack.pop()


browse_ratings = BrowseRatings()
