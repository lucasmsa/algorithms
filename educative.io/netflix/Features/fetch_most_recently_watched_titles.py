class LinkedListNode:
    def __init__(self, key, data):
        self.data = data
        self.key = key
        self.next = None
        self.prev = None


class LinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def insert_at_head(self, data):
        new_node = LinkedListNode(data)
        if self.head == None:
            self.tail = new_node
            self.head = new_node
        else:
            new_node.next = self.head
            self.head.prev = new_node
            self.head = new_node

        self.size += 1

    def insert_at_tail(self, key, data):
        new_node = LinkedListNode(key, data)
        if self.tail == None:
            self.tail = new_node
            self.head = new_node
            new_node.next = None
        else:
            self.tail.next = new_node
            new_node.prev = self.tail
            self.tail = new_node
            new_node.next = None

        self.size += 1

    def remove_node(self, node):
        if node == None:
            return

        if node.prev != None:
            node.prev.next = node.next

        if node.next != None:
            node.next.prev = node.prev

        if node == self.head:
            self.head = self.head.next

        if node == self.tail:
            self.tail = self.tail.prev
        self.size -= 1

        return node

    def remove_head(self):
        return self.remove_node(self.head)

    def remove_tail(self):
        return self.remove_node(self.tail)

    def get_head(self):
        return self.head

    def get_tail(self):
        return self.tail

    def get_size(self):
        return self.size


# O(1) Time | O(k) Space
# Where k is its capacity
class LruStructure:
    def __init__(self, capacity):
        self.capacity = capacity
        self.cache = {}
        self.cache_vals = LinkedList()

    # O(1) Time
    def set(self, key, value):
        if key not in self.cache:
            if self.cache_vals.get_size() >= self.capacity:
                old_head = self.cache_vals.remove_head()
                del self.cache[old_head.key]
            self.cache_vals.insert_at_tail(key, value)
            node = self.cache_vals.get_tail()
            self.cache[key] = node
        else:
            node = self.cache[key]
            value = self.cache[key].data
            self.cache_vals.remove_node(node)
            self.cache_vals.insert_at_tail(key, value)
            self.cache[key] = self.cache_vals.get_tail()

    # O(1) Time
    def get(self, key):
        if key not in self.cache:
            return None
        node = self.cache[key]
        value = self.cache[key].data
        self.cache_vals.remove_node(node)
        self.cache_vals.insert_at_tail(key, value)

        return value

    def print_data(self):
        node = self.cache_vals.get_head()
        while node != None:
            print("(" + str(node.key) + "," + str(node.data) + ")", end="")
            node = node.next
