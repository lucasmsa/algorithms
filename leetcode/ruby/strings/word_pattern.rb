# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  pattern_word_matcher = {}
  already_found_matches = Set.new([])
  words_count = 0

  pattern_index = 0
  word = []

  (0...s.length).each do |index|
    return false if pattern_index == pattern.length

    letter = s[index]

    if letter == ' ' || index == s.length - 1
      word << letter if index == s.length - 1
      word_to_match = word.join

      if pattern_word_matcher.key?(pattern[pattern_index])
        return false if pattern_word_matcher[pattern[pattern_index]] != word_to_match
      else
        return false if already_found_matches.include?(word_to_match)

        pattern_word_matcher[pattern[pattern_index]] = word_to_match
        already_found_matches.add(word_to_match)
      end

      word = []
      words_count += 1
      pattern_index += 1
    else
      word << letter
    end
  end

  words_count == pattern.length
end
