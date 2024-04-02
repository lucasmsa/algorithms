# Description on Notion
from heapq import *


# O(logn) Time | O(n) Space
class MedianOfAges:
    max_heap = []
    min_heap = []

    # O(logn) Time
    def insert_age(self, value):
        if not len(self.max_heap) or -self.max_heap[0] >= value:
            heappush(self.max_heap, -value)
        else:
            heappush(self.min_heap, value)

        if len(self.max_heap) > len(self.min_heap) + 1:
            heappush(self.min_heap, -heappop(self.max_heap))
        elif len(self.max_heap) < len(self.min_heap):
            heappush(self.max_heap, -heappop(self.min_heap))

    # O(1) Space
    def find_median(self):
        if len(self.max_heap) == len(self.min_heap):
            return (-self.max_heap[0] + self.min_heap[0]) / 2.0

        return -self.max_heap[0]


medianAge = MedianOfAges()
medianAge.insert_age(22)
medianAge.insert_age(24)
medianAge.insert_age(39)
medianAge.insert_age(30)
medianAge.insert_age(25)
medianAge.insert_age(35)
print("The recommended content will be for ages under: " +
      str(medianAge.find_median()))
print(medianAge.min_heap)
print(medianAge.max_heap)
