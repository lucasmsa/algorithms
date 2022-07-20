import collections


class LinkedListNode(object):
    def __init__(self, key, value, freq):
        self.key = key
        self.val = value
        self.freq = freq
        self.next = None
        self.prev = None


class LinkedList(object):
    def __init__(self):
        self.head = None
        self.tail = None

    def append(self, node):
        node.next, node.prev = None, None
        if self.head is None:
            self.head = node
        else:
            self.tail.next = node
            node.prev = self.tail
        self.tail = node

    def delete(self, node):
        if node.prev:
            node.prev.next = node.next
        else:
            self.head = node.next
        if node.next:
            node.next.prev = node.prev
        else:
            self.tail = node.prev
        node.next, node.prev = None, None

# O(1) Time | O(k) Space


class LruStructure:
    def __init__(self, capacity):
        self.capacity = capacity
        self.size = 0
        self.min_freq = 0
        self.freq_dict = collections.defaultdict(LinkedList)
        self.key_dict = {}

    # O(1) Time
    def get(self, key):
        if key not in self.key_dict:
            return None

        temp = self.key_dict[key]
        self.key_dict[key] = LinkedListNode(key, temp.val, temp.freq)
        self.freq_dict[temp.freq].delete(temp)
        if not self.freq_dict[self.key_dict[key].freq].head:
            del self.freq_dict[self.key_dict[key].freq]
            if self.min_freq == self.key_dict[key].freq:
                self.min_freq += 1

        self.key_dict[key].freq += 1
        self.freq_dict[self.key_dict[key].freq].append(self.key_dict[key])

        return self.key_dict[key].val

    # O(1) Time
    def set(self, key, value):
        if self.get(key) != None:
            self.key_dict[key].val = value
            return None

        if self.size == self.capacity:
            del self.key_dict[self.freq_dict[self.min_freq].head.key]
            self.freq_dict[self.min_freq].delete(
                self.freq_dict[self.min_freq].head)
            if not self.freq_dict[self.min_freq].head:
                del self.freq_dict[self.min_freq]
            self.size -= 1

        self.min_freq = 1
        self.key_dict[key] = LinkedListNode(key, value, self.min_freq)
        self.freq_dict[self.min_freq].append(self.key_dict[key])
        self.size += 1
