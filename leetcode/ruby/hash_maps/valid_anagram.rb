# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false unless s.length == t.length

  letters = {}

  t.each_char do |character|
    if letters.key?(character)
      letters[character] += 1
    else
      letters[character] = 1
    end
  end

  letters_are_zero = 0

  s.each_char do |character|
    return false unless letters.key?(character)

    letters[character] -= 1

    letters_are_zero += 1 if letters[character].zero?
    return false if letters[character].negative?
  end

  letters_are_zero == letters.size
end
