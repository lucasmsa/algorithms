# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  last_space_before_word_index = -1
  first_space_after_word_index = -1

  (0...s.length).each do |index|
    character_is_space = s[index] == ' '

    if character_is_space and s[index + 1] and s[index + 1] != ' '
      last_space_before_word_index = index
    elsif character_is_space and s[index - 1] and s[index - 1] != ' '
      first_space_after_word_index = index - 1
    end

    first_space_after_word_index = index if index == s.length - 1 and !character_is_space
  end

  first_space_after_word_index - last_space_before_word_index
end
