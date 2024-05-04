# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  grouped_anagrams = {}

  strs.each do |str|
    sorted_string = str.chars.sort_by(&:downcase).join
    stringified_letters = get_word_letter_frequency(sorted_string)

    if grouped_anagrams.key?(stringified_letters)
      grouped_anagrams[stringified_letters] << str
    else
      grouped_anagrams[stringified_letters] = [str]
    end
  end

  grouped_anagrams.values
end

def get_word_letter_frequency_stringified(str)
  letters_frequency = {}

  str.each_char do |character|
    if letters_frequency.key?(character)
      letters_frequency[character] += 1
    else
      letters_frequency[character] = 1
    end
  end
end

# {
#   "b2c3e1": [1, 2, 3],
#   "a1d2": [4, 5],
#   "o1d2": [0]
# }
