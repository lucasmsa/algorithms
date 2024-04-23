def is_digit?(s)
  code = s.ord
  48 <= code && code <= 57
end

def is_letter?(s)
  code = s.ord
  (97 <= code && code <= 122) || (65 <= code && code <= 90)
end

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  left_pointer = 0
  right_pointer = s.length - 1

  while left_pointer < right_pointer
    left_character = s[left_pointer]
    right_character = s[right_pointer]

    if !is_letter?(left_character) && !is_digit?(left_character)
      left_pointer += 1
    elsif !is_letter?(right_character) && !is_digit?(right_character)
      right_pointer -= 1
    else
      return false unless left_character.downcase == right_character.downcase

      left_pointer += 1
      right_pointer -= 1
    end
  end

  true
end
