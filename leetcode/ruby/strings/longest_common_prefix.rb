class Trie
  attr_accessor :root

  def initialize
    @root = {}
  end

  def add_all_words(words)
    words.each do |word|
      if word == ''
        @root = {}
        break
      end
      add_word(word)
    end
  end

  def add_word(word)
    current_node = @root
    word.each_char.with_index do |letter, index|
      current_node[:children] = {} unless current_node.key?(:children)

      current_node[:children][letter] = {} unless current_node[:children].key?(letter)

      current_node[:end_of_word] = true if index == word.length - 1
      current_node = current_node[:children][letter]
    end
  end

  def search(word)
    current_node = @root
    word.each_char do |letter|
      return false unless current_node[:children].key?(letter)

      current_node = current_node[:children][letter]
    end

    current_node.key?(:end_of_word)
  end

  def largest_prefix
    current_node = @root
    largest_prefix = ''

    while true
      break if !current_node.key?(:children) || current_node[:children].size > 1

      letter, value = current_node[:children].first
      largest_prefix = "#{largest_prefix}#{letter}"
      break if current_node.key?(:end_of_word)

      current_node = value
    end

    largest_prefix
  end
end

# @param {String[]} strs
# @return {String}
# O(n*k) Time where k is the lenght of the largest string
def longest_common_prefix(strs)
  trie = Trie.new
  trie.add_all_words(strs)
  trie.largest_prefix
end
