# Description#
# First, we need to figure out a way to individually group all the character combinations of each title. Suppose the content library contains the following titles: "duel", "dule", "speed", "spede", "deul", "cars". How would you efficiently implement a functionality so that if a user misspells speed as spede, they are shown the correct title?

# We want to split the list of titles into sets of words so that all words in a set are anagrams. In the above list, there are three sets: {"duel", "dule", "deul"}, {"speed", "spede"}, and {"cars"}. Search results should comprise all members of the set that the search string is found in. We should pre-compute these sets instead of forming them when the user searches a title.

# Here is an illustration of this process:
from typing import List

# For each title, compute a 26-element vector. Each element in this vector represents the frequency of an English letter in the corresponding title. This frequency count will be represented as a tuple. For example, abbccc will be represented as (1, 2, 3, 0, 0, ..., 0). This mapping will generate identical vectors for strings that are anagrams.

# Use this vector as a key to insert the titles into a Hash Map. All anagrams will be mapped to the same entry in this Hash Map. When a user searches a word, compute the 26-element English letter frequency vector based on the word. Search in the Hash Map using this vector and return all the map entries.

# Store the list of the calculated character counts in the same Hash Map as a key and assign the respective set of anagrams as its value.

# Return the values of the Hash Map, since each value will be an individual set.


# O(n * m) Time | O(n * m)
# n -> Size of the list of titles
# m -> Size of the largest title
def group_titles(titles: List[str]):
    ASCII_LOWERCASE_START = 97
    titles_grouped = {}

    for title in titles:
        alphabet_letter_frequency = [0 for _ in range(26)]
        for letter in title:
            letter_position = ord(letter.lower()) - ASCII_LOWERCASE_START
            alphabet_letter_frequency[letter_position] += 1

        tuple_alphabet = tuple(alphabet_letter_frequency)

        if tuple_alphabet in titles_grouped:
            titles_grouped[tuple_alphabet].append(title)
        else:
            titles_grouped[tuple_alphabet] = [title]

    return titles_grouped.values()


print(group_titles(["duel", "dule", "speed", "spede", "deul", "cars"]))
