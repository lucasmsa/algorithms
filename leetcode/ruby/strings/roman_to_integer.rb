# @param {String} s
# @return {Integer}
def roman_to_int(s)
  return 0 if s.empty?

  single_digits_matcher = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  double_digits_matcher = {
    'IX' => 9,
    'IV' => 4,
    'XL' => 40,
    'XC' => 90,
    'CD' => 400,
    'CM' => 900
  }

  index = 0
  number = 0
  last_index = s.length - 1

  while index < last_index
    current_character = s[index]
    next_character = s[index + 1]
    double_characters = "#{current_character}#{next_character}"

    if double_digits_matcher.key?(double_characters)
      number += double_digits_matcher[double_characters]
      index += 1
    elsif single_digits_matcher.key?(current_character)
      number += single_digits_matcher[current_character]
    end

    index += 1
  end

  number += single_digits_matcher[s[last_index]] if index == last_index

  number
end
