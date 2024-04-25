# @param {String} s
# @return {Boolean}
def is_valid(s)
  return true unless s.length

  brackets = []
  opening_brackets = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }
  closing_brackets = {
    ')' => '(',
    '}' => '{',
    ']' => '['
  }

  s.each_char do |bracket|
    if opening_brackets.key?(bracket)
      brackets << bracket
    elsif closing_brackets.key?(bracket)
      return false unless brackets.length
      return false if brackets.last != closing_brackets[bracket]

      brackets.pop
    end
  end

  puts "#{brackets}"
  brackets.empty?
end
